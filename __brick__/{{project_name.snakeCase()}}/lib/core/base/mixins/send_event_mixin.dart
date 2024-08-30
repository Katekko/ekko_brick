import '../extensions/string.extension.dart';
import '../analytics/analytics_events.enum.dart';
import '../analytics/analytics_provider.dart';

mixin SendEventMixin {
  AnalyticsProvider get provider;
  String get category;

  Future<void> sendEvent({
    required AnalyticsEventsEnum event,
    required String label,
    Map<String, dynamic>? customParams,
  }) {
    return provider.sendEvent(
      name: event.value,
      parameters: {
        'category': category,
        'label': label.toAnalyticsFormat,
        ...?customParams,
      },
    );
  }

  Future<void> sendClickEvent(String label) {
    return sendEvent(event: AnalyticsEventsEnum.click, label: label);
  }

  Future<void> setUserId(String? useId) {
    return provider.setUserId(useId);
  }
}
