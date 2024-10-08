import '../../../core/base/inject.dart';
import '../../../core/resources/user/dal/user_repository.dart';
import '../presentation/home_controller.dart';
import '../presentation/tag/home_tag.dart';
import '../presentation/tag/logout_dialog_tag.dart';
import '../usecases/logout_usecase.dart';

class HomeControllerBinding {
  static void inject() {
    Inject.injectController<HomeController>(makeHomeController);
    Inject.lazyPut(makeHomeTag);
    Inject.lazyPut(makeLogoutDialogTag);
  }

  static void dipose() {
    Inject.disposeController<HomeController>();
    Inject.remove<HomeTag>();
    Inject.remove<LogoutDialogTag>();
  }
}

HomeController makeHomeController() {
  final userRepository = UserRepository(
    userDatasource: Inject.find(),
    storage: Inject.find(),
  );

  final logoutUsecase = LogoutUsecase(userRepository: userRepository);

  return HomeController(logoutUsecase: logoutUsecase);
}

HomeTag makeHomeTag() {
  return HomeTag(Inject.find());
}

LogoutDialogTag makeLogoutDialogTag() {
  return LogoutDialogTag(Inject.find());
}
