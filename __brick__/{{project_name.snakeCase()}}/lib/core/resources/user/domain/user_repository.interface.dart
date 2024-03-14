import 'entities/user.entity.dart';

abstract class IUserRepository {
  Future<({User user, String token})> authenticate({
    required String login,
    required String password,
  });

  Future<void> save(User user);

  Future<void> saveToken(String token);

  Future<bool> isLoggedIn();

  Future<void> signUp({required String email, required String password});

  Future<void> clearData();
}
