abstract class CrashlyticsProvider {
  Future<void> setCrashlyticsCollectionEnabled(bool enabled);

  Future<void> setUserIdentifier(String identifier);

  Future<void> logMessage(String message);

  Future<void> recordError(
    dynamic exception,
    StackTrace? stack, {
    dynamic reason,
    bool? printDetails,
    bool fatal = false,
  });

  Future<void> setCustomKey(String key, Object value);

  Future<void> recordFlutterFatalError(
    flutterErrorDetails, {
    bool fatal = false,
  });
}
