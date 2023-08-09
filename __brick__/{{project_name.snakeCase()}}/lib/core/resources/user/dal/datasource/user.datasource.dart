import '../../../../base/abstractions/http_connect.interface.dart';
import '../../../../base/exceptions/http_failure.exception.dart';
import '../../domain/constants/errors.constants.dart';
import '../../domain/exceptions/email_already_in_use.exception.dart';
import '../../domain/exceptions/user_or_password_incorrect.exception.dart';
import '../dto/authenticate_user.body.dart';
import '../dto/authenticate_user.response.dart';
import '../dto/sign_up.body.dart';
import '../dto/sign_up.response.dart';
import 'user.datasource.interface.dart';

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
      if (error.id == ErrosConstants.email ||
          error.id == ErrosConstants.password) {
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
      if (error.id == ErrosConstants.email) {
        throw EmailAlreadyInUseException(failure: error);
      }

      rethrow;
    }
  }
}
