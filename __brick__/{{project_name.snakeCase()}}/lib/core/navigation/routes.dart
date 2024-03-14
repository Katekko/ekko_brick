import '../base/inject.dart';
import '../resources/user/dal/user.repository.dart';

class Routes {
  static Future<String> get initialRoute async {
    try {
      final userRepository = UserRepository(
        userDatasource: Inject.find(),
        storage: Inject.find(),
      );

      final isUserLoggedIn = await userRepository.isLoggedIn();
      if (isUserLoggedIn) return home;
      return login;
    } catch (err) {
      return login;
    }
  }

  static const login = '/login';
  static const home = '/home';
}
