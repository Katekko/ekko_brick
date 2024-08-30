import '../../../base/dal/storage/storage_interface.dart';
import '../domain/constants/user_storage_constants.dart';
import '../domain/entities/user_entity.dart';
import '../domain/mappers/user_mapper.dart';
import '../domain/mappers/user_model_mapper.dart';
import 'datasource/user_datasource_interface.dart';
import 'dto/authenticate_user_body.dart';
import 'dto/sign_up_body.dart';

class UserRepository {
  final IUserDatasource userDatasource;
  final IStorage storage;
  const UserRepository({required this.userDatasource, required this.storage});

  Future<({User user, String token})> authenticate({
    required String login,
    required String password,
  }) async {
    final body = AuthenticateUserBody(email: login, password: password);
    final response = await userDatasource.authenticateUser(body);
    final model = response.user.toEntity();
    return (user: model, token: response.token);
  }

  Future<void> save(User user) async {
    final json = user.toMap();
    await storage.write(key: UserStorageConstants.user, value: json);
  }

  Future<void> saveToken(String token) async {
    await storage.write(
      key: UserStorageConstants.tokenAuthorization,
      value: token,
    );
  }

  Future<bool> isLoggedIn() async {
    final user = await storage.read(UserStorageConstants.user);
    final token = await storage.read(UserStorageConstants.tokenAuthorization);

    return token != null && user != null;
  }

  Future<void> signUp({required String email, required String password}) async {
    final body = SignUpBody(email: email, password: password);
    await userDatasource.signUp(body);
  }

  Future<void> clearData() async {
    await storage.remove(UserStorageConstants.user);
    await storage.remove(UserStorageConstants.tokenAuthorization);
  }
}
