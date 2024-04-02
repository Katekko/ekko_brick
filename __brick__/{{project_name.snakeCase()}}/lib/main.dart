import 'dart:async';

import 'package:flutter/material.dart';

import 'config.dart';
import 'core/base/crashlytics/crashlytics_provider.dart';
import 'core/base/inject.dart';
import 'core/navigation/navigation.dart';
import 'core/navigation/routes.dart';
import 'initializer.dart';

void main() async {
  await runZonedGuarded(
    () async {
      await Initializer.init();
      Initializer.initialRoute = await Routes.initialRoute;
      runApp(const MyApp());
    },
    (error, stack) {
      final crashlytics = Inject.find<CrashlyticsProvider>();
      crashlytics.recordError(error, stack);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
