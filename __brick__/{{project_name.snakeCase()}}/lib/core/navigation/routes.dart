import '../base/inject.dart';
import '../resources/user/dal/user_repository.dart';

class Routes {
  static Future<String> get initialRoute async {
    try {
      // TODO: Changing to call a use case
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
