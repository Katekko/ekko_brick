import '../../../core/base/inject.dart';
import '../../../core/resources/user/dal/user.repository.dart';
import '../presentation/home.controller.dart';
import '../usecases/logout.usecase.dart';
import 'home_controller.interface.dart';

class HomeControllerBinding {
  static void inject() {
    Inject.injectController<IHomeController>(makeHomeController);
  }

  static void dipose() {
    Inject.disposeController<IHomeController>();
  }
}

IHomeController makeHomeController() {
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
