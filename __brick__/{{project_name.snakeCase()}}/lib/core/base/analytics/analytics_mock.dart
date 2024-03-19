import 'dart:developer';

import 'analytics_provider.dart';

class AnalyticsMock implements AnalyticsProvider {
  @override
  Future<void> sendEvent({
    required String name,
    required Map<String, dynamic> parameters,
  }) async {
    log(
      '${parameters.values}'
          .replaceAll('(', '')
          .replaceAll(')', '')
          .replaceAll(', ', ':'),
      name: name,
    );
  }

  @override
  Future<void> setCurrentScreen(String screenName) async {
    log(screenName, name: 'event - setCurrentScreen');
  }

  @override
  Future<void> setUserId(String id) async {
    log(id, name: 'event - setUserId');
  }
}
