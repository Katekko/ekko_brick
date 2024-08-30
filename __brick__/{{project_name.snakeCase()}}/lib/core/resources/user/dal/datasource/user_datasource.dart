import '../../../../base/abstractions/http_connect_interface.dart';
import '../../../../base/exceptions/http_failure_exception.dart';
import '../../domain/constants/user_errors_constants.dart';
import '../../domain/exceptions/email_already_in_use_exception.dart';
import '../../domain/exceptions/user_or_password_incorrect_exception.dart';
import '../dto/authenticate_user_body.dart';
import '../dto/authenticate_user_response.dart';
import '../dto/sign_up_body.dart';
import '../dto/sign_up_response.dart';
import 'user_datasource_interface.dart';

class UserDatasource implements IUserDatasource {
  final IHttpConnect _connect;
  const UserDatasource({required IHttpConnect connect}) : _connect = connect;

  @override
  Future<AuthenticateUserDataResponse> authenticateUser(
    AuthenticateUserBody body,
  ) async {
    try {
      final response = await _connect.post<AuthenticateUserResponse>(
        'users/login',
        body.toJson(),
        decoder: AuthenticateUserResponse.fromJson,
      );

      return response.payload!.data!;
    } on HttpFailureException<AuthenticateUserResponse> catch (err) {
      final error = err.object.errors!.first;
      if (error.id == UserErrosConstants.email ||
          error.id == UserErrosConstants.password) {
        throw UserOrPasswordIncorrectException(failure: error);
      }

      rethrow;
    }
  }

  @override
  Future<SignUpResponse> signUp(SignUpBody body) async {
    try {
      final response = await _connect.post<SignUpResponse>(
        'users',
        body.toJson(),
        decoder: SignUpResponse.fromJson,
      );

      return response.payload!;
    } on HttpFailureException<SignUpResponse> catch (err) {
      final error = err.object.errors!.first;
      if (error.id == UserErrosConstants.email) {
        throw EmailAlreadyInUseException(failure: error);
      }

      rethrow;
    }
  }
}
