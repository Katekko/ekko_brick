abstract class AnalyticsProvider {
  const AnalyticsProvider();

  Future<void> setUserId(String? id);

  Future<void> setCurrentScreen(String screenName);

  Future<void> sendEvent({
    required String name,
    required Map<String, dynamic> parameters,
  });
}
