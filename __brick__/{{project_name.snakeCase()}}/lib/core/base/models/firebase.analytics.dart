import 'package:firebase_analytics/firebase_analytics.dart';

import '../analytics/analytics_provider.dart';

class FirebaseAnalyticsImpl implements AnalyticsProvider {
  @override
  Future<void> sendEvent({
    required String name,
    required Map<String, dynamic> parameters,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<void> setCurrentScreen(String screenName) {
    throw UnimplementedError();
  }

  @override
  Future<void> setUserId(String id) {
    throw UnimplementedError();
  }
}
