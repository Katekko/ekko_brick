import 'package:go_router/go_router.dart';

import '../../features/home/presentation/home.screen.dart';
import '../utils/provider.util.dart';
import '../../initializer.dart';
import '../../features/home/domain/bindings/home_controller.binding.dart';
import 'routes.dart';

class Navigation {
  static final router = GoRouter(
    initialLocation: Initializer.initialRoute,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.home,
        name: Routes.home,
        builder: (context, state) => EntryProvider(
          onBuild: (_) => const HomeScreen(),
          onInit: (_) => HomeControllerBinding.inject(),
          onDispose: (_) => HomeControllerBinding.dipose(),
        ),
      ),
    ],
  );
}
