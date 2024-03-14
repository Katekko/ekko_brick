import '../../../base/dal/storage/storage.interface.dart';
import '../domain/constants/user_storage.constants.dart';
import '../domain/entities/user.entity.dart';
import 'datasource/user.datasource.interface.dart';
import 'dto/authenticate_user.body.dart';
import 'dto/sign_up.body.dart';
import 'mappers/user.mapper.dart';

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
    final model = UserMapper.toModel(response.user);
    return (user: model, token: response.token);
  }

  Future<void> save(User user) async {
    final json = UserMapper.toJson(user);
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
