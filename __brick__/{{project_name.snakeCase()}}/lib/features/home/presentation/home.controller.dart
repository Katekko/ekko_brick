import '../../../core/base/abstractions/controller.interface.dart';
import '../../shared/loading/loading.interface.dart';
import '../usecases/logout.usecase.dart';

class HomeController implements IController {
  final ILoadingController loading;
  final LogoutUsecase logoutUsecase;

  HomeController({required this.loading, required this.logoutUsecase});

  Future<void> logout() async {
    await logoutUsecase();
  }

  @override
  void dispose() {}
}
