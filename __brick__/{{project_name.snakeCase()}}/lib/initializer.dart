import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';

import 'config.dart';
import 'core/base/abstractions/http_connect_interface.dart';
import 'core/base/analytics/analytics_mock.dart';
import 'core/base/analytics/analytics_provider.dart';
import 'core/base/constants/storage_constants.dart';
import 'core/base/crashlytics/crashlytics_mock.dart';
import 'core/base/crashlytics/crashlytics_provider.dart';
import 'core/base/dal/storage/getx_storage.dart';
import 'core/base/dal/storage/storage_interface.dart';
import 'core/base/inject.dart';
import 'core/base/models/fb_crashlytics.dart';
import 'core/base/models/firebase_analytics.dart';
import 'core/base/models/http_connect.dart';
import 'core/base/models/token_client.dart';
import 'core/l10n/en_us.dart';
import 'core/l10n/pt_br.dart';
import 'core/l10n/translation.dart';
import 'core/resources/user/dal/datasource/user_datasource_interface.dart';
import 'core/resources/user/dal/datasource/user_datasource_mock.dart';
import 'features/shared/loading/loading_controller.dart';

class Initializer {
  static late final String initialRoute;

  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      _initScreenPreference();
      _initGlobalLoading();
      await _initStorage();
      await _initI18n();
      await _initConnect();
      _initDatasourceDependencies();
      await _initFirebase();
      _initAnalytics();
      await _initCrashylitics();
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
    Inject.put<LoadingController>(loading);
  }

  static void _initDatasourceDependencies() {
    //  TODO: Change this to user server instead a local mock
    //  final connect = Inject.find<IHttpConnect>();
    //  final authDatasource = UserDatasource(connect: connect);

    final authDatasource = UserDatasourceMock();
    Inject.put<IUserDatasource>(authDatasource);
  }

  static Future<void> _initStorage() async {
    await GetStorage.init();
    final storage = GetxStorage(storage: GetStorage());
    Inject.put<IStorage>(storage);
  }

  static Future<void> _initI18n() async {
    StringsTranslations getCurrentI18n(String locale) {
      switch (locale) {
        case PtBrStringsTranslations.getLocale:
          return PtBrStringsTranslations();
        case EnUsStringsTranslations.getLocale:
          return EnUsStringsTranslations();
        default:
          return PtBrStringsTranslations();
      }
    }

    final storage = Inject.find<IStorage>();
    final locale = await storage.read(StorageConstants.locale);

    late StringsTranslations i18n;
    if (locale != null) {
      i18n = getCurrentI18n(locale);
    } else {
      final currentLocale = await Devicelocale.currentLocale;
      if (currentLocale != null) {
        i18n = getCurrentI18n(currentLocale);
      } else {
        i18n = EnUsStringsTranslations();
      }
    }

    Inject.put<StringsTranslations>(i18n);
  }

  static Future<void> _initConnect() async {
    final storage = Inject.find<IStorage>();
    final client = TokenClient(storage);
    final connect = HttpConnect(client);
    Inject.put<IHttpConnect>(connect);
  }

  static Future<void> _initFirebase() async {
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
  }

  static void _initAnalytics() async {
    final provider = kDebugMode ? AnalyticsMock() : FirebaseAnalyticsImpl();

    Inject.put<AnalyticsProvider>(provider);
  }

  static Future<void> _initCrashylitics() async {
    final crashlyticsProvider = kDebugMode
        ? CrashlyticsMock(includeStackTrace: false)
        : FbCrashlytics();

    Inject.put<CrashlyticsProvider>(crashlyticsProvider);

    await crashlyticsProvider.setCrashlyticsCollectionEnabled(!kDebugMode);
    await crashlyticsProvider.setCustomKey(
      'environment',
      ConfigEnvironments.getCurrentEnviroment,
    );
    FlutterError.onError = crashlyticsProvider.recordFlutterFatalError;
  }
}
