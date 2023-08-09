import '../../../base/dal/storage/storage.interface.dart';
import '../domain/constants/user_storage.constants.dart';
import '../domain/models/user.model.dart';
import '../domain/user_repository.interface.dart';
import 'datasource/user.datasource.interface.dart';
import 'dto/authenticate_user.body.dart';
import 'dto/sign_up.body.dart';
import 'mappers/user.mapper.dart';

class UserRepository implements IUserRepository {
  final IUserDatasource userDatasource;
  final IStorage storage;
  const UserRepository({required this.userDatasource, required this.storage});

  @override
  Future<({UserModel user, String token})> authenticate({
    required String login,
    required String password,
  }) async {
    final body = AuthenticateUserBody(email: login, password: password);
    final response = await userDatasource.authenticateUser(body);
    final model = UserMapper.toModel(response.user);
    return (user: model, token: response.token);
  }

  @override
  Future<void> save(UserModel user) async {
    final json = UserMapper.toJson(user);
    await storage.write(key: UserStorageConstants.user, value: json);
  }

  @override
  Future<void> saveToken(String token) async {
    await storage.write(
      key: UserStorageConstants.tokenAuthorization,
      value: token,
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    final user = await storage.read(UserStorageConstants.user);
    final token = await storage.read(UserStorageConstants.tokenAuthorization);

    return token != null && user != null;
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    final body = SignUpBody(email: email, password: password);
    await userDatasource.signUp(body);
  }

  @override
  Future<void> clearData() async {
    await storage.remove(UserStorageConstants.user);
    await storage.remove(UserStorageConstants.tokenAuthorization);
  }
}
