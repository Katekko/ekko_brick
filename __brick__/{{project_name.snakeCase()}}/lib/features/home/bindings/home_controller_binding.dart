import '../../../core/base/inject.dart';
import '../../../core/resources/user/dal/user.repository.dart';
import '../presentation/home.controller.dart';
import '../presentation/tag/home.tag.dart';
import '../presentation/tag/logout_dialog.tag.dart';
import '../usecases/logout.usecase.dart';

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
