import 'package:flutter/material.dart';

import 'config.dart';
import 'core/navigation/navigation.dart';
import 'core/navigation/routes.dart';
import 'initializer.dart';

void main() async {
  Initializer.init();
  final initialRoute = await Routes.initialRoute;
  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: Navigation.router);
  }
}

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  const EnvironmentsBadge({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.production
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.staging ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}
