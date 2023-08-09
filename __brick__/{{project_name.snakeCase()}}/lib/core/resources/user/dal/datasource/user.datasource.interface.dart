import '../dto/authenticate_user.body.dart';
import '../dto/authenticate_user.response.dart';
import '../dto/sign_up.body.dart';

abstract class IUserDatasource {
  Future<AuthenticateUserDataResponse> authenticateUser(
    AuthenticateUserBody body,
  );

  Future<void> signUp(SignUpBody body);
}
