import 'dart:developer';

import 'crashlytics_provider.dart';

class CrashlyticsMock implements CrashlyticsProvider {
  CrashlyticsMock({this.includeStackTrace = true});

  final bool includeStackTrace;

  @override
  Future<void> logMessage(String message) async {
    log(message, level: 3, name: 'Crashlytics');
  }

  @override
  Future<void> setCrashlyticsCollectionEnabled(bool enabled) async {
    log(
      'setCrashlyticsCollectionEnabled: $enabled',
      name: 'Crashlytics',
      stackTrace: includeStackTrace ? StackTrace.current : null,
    );
  }

  @override
  Future<void> setCustomKey(String key, Object value) async {
    log(
      'setCustomKey: ${{key: value}.toString()}',
      name: 'Crashlytics',
      stackTrace: includeStackTrace ? StackTrace.current : null,
    );
  }

  @override
  Future<void> setUserIdentifier(String identifier) async {
    log(
      'setUserIdentifier: $identifier',
      name: 'Crashlytics',
      stackTrace: includeStackTrace ? StackTrace.current : null,
    );
  }

  @override
  Future<void> recordError(
    exception,
    StackTrace? stack, {
    reason,
    bool? printDetails,
    bool fatal = false,
  }) async {
    log(
      exception.toString(),
      level: 1,
      name: 'Crashlytics',
      stackTrace: includeStackTrace ? stack : null,
    );
  }

  @override
  Future<void> recordFlutterFatalError(
    flutterErrorDetails, {
    bool fatal = false,
  }) async {
    log(
      'recordFlutterError: $flutterErrorDetails',
      level: 3,
      name: 'Crashlytics',
    );
  }
}
