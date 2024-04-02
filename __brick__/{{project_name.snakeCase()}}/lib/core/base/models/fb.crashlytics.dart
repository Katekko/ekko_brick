import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import '../crashlytics/crashlytics_provider.dart';

class FbCrashlytics implements CrashlyticsProvider {
  @override
  Future<void> logMessage(String message) async {
    throw UnimplementedError();
  }

  @override
  Future<void> recordError(
    exception,
    StackTrace? stack, {
    reason,
    bool? printDetails,
    bool fatal = false,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<void> setCrashlyticsCollectionEnabled(bool enabled) async {
    throw UnimplementedError();
  }

  @override
  Future<void> setCustomKey(String key, Object value) async {
    throw UnimplementedError();
  }

  @override
  Future<void> setUserIdentifier(String identifier) async {
    throw UnimplementedError();
  }

  @override
  Future<void> recordFlutterFatalError(
    flutterErrorDetails, {
    bool fatal = false,
  }) async {
    throw UnimplementedError();
  }
}
