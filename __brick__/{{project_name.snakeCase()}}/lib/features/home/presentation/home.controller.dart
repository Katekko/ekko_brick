import '../../shared/loading/loading.interface.dart';
import '../bindings/home_controller.interface.dart';
import '../usecases/logout.usecase.dart';

class HomeController implements IHomeController {
  final ILoadingController loading;
  final LogoutUsecase logoutUsecase;

  HomeController({required this.loading, required this.logoutUsecase});

  @override
  Future<void> logout() async {
    await logoutUsecase();
  }

  @override
  void dispose() {}
}
