import '../base/inject.dart';
import '../resources/user/dal/user.repository.dart';

class Routes {
  static Future<String> get initialRoute async {
    try {
      final authRepository = UserRepository(
        userDatasource: Inject.find(),
        storage: Inject.find(),
      );

      final isUserLoggedIn = await authRepository.isLoggedIn();
      if (isUserLoggedIn) return home;
      return login;
    } catch (err) {
      return login;
    }
  }

  static const login = '/login';
  static const home = '/home';
}
