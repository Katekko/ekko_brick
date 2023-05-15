import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'core/inject.dart';
import 'features/shared/loading/loading.controller.dart';
import 'features/shared/loading/loading.interface.dart';

class Initializer {
  static late final String initialRoute;

  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      _initScreenPreference();
      _initGlobalLoading();
    } catch (err) {
      rethrow;
    }
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static void _initGlobalLoading() {
    final loading = LoadingController();
    Inject.put<ILoadingController>(loading);
  }
}
