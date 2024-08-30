import '../../../core/base/abstractions/controller_interface.dart';
import '../usecases/logout_usecase.dart';

class HomeController extends IController {
  final LogoutUsecase logoutUsecase;

  HomeController({required this.logoutUsecase});

  Future<void> logout() async {
    await logoutUsecase();
  }

  @override
  void dispose() {}
}
