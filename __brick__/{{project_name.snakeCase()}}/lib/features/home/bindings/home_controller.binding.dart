import '../../../core/base/inject.dart';
import '../../../core/resources/user/dal/user.repository.dart';
import '../presentation/home.controller.dart';
import '../usecases/logout.usecase.dart';

class HomeControllerBinding {
  static void inject() {
    Inject.injectController<HomeController>(makeHomeController);
  }

  static void dipose() {
    Inject.disposeController<HomeController>();
  }
}

HomeController makeHomeController() {
  final userRepository = UserRepository(
    userDatasource: Inject.find(),
    storage: Inject.find(),
  );

  final logoutUsecase = LogoutUsecase(userRepository: userRepository);

  return HomeController(
    loading: Inject.find(),
    logoutUsecase: logoutUsecase,
  );
}
