import 'models/user.model.dart';

abstract class IUserRepository {
  Future<({UserModel user, String token})> authenticate({
    required String login,
    required String password,
  });

  Future<void> save(UserModel user);

  Future<void> saveToken(String token);

  Future<bool> isLoggedIn();

  Future<void> signUp({required String email, required String password});

  Future<void> clearData();
}
