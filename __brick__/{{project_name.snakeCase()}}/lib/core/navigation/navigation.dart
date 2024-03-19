import 'package:go_router/go_router.dart';

import '../../features/bindings.dart';
import '../../features/screens.dart';
import '../../initializer.dart';
import '../base/utils/entry_provider.util.dart';
import 'routes.dart';

class Navigation {
  static final router = GoRouter(
    initialLocation: Initializer.initialRoute,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.login,
        name: Routes.login,
        builder: (context, state) => EntryProvider(
          screenName: Routes.login,
          onBuild: (_) => const LoginScreen(),
          onInit: (_) => LoginControllerBinding.inject(),
          onDispose: (_) => LoginControllerBinding.dipose(),
        ),
      ),
      GoRoute(
        path: Routes.home,
        name: Routes.home,
        builder: (context, state) => EntryProvider(
          screenName: Routes.home,
          onBuild: (_) => const HomeScreen(),
          onInit: (_) => HomeControllerBinding.inject(),
          onDispose: (_) => HomeControllerBinding.dipose(),
        ),
      ),
    ],
  );
}
