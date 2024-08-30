import '../dto/authenticate_user_body.dart';
import '../dto/authenticate_user_response.dart';
import '../dto/sign_up_body.dart';

abstract class IUserDatasource {
  Future<AuthenticateUserDataResponse> authenticateUser(
    AuthenticateUserBody body,
  );

  Future<void> signUp(SignUpBody body);
}
