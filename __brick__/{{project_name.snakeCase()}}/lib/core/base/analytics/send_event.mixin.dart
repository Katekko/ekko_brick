import '../extensions/string.extension.dart';
import 'analytics_actions.enum.dart';
import 'analytics_provider.dart';

mixin SendEventMixin {
  AnalyticsProvider get provider;
  String get category;

  Future<void> sendEvent({
    required AnalyticsActionsEnum action,
    required String label,
  }) {
    return provider.sendEvent(
      name: 'event',
      parameters: {
        'category': category,
        'action': action.value,
        'label': label.toAnalyticsFormat,
      },
    );
  }

  Future<void> sendButtonClick(String label) {
    return sendEvent(
      action: AnalyticsActionsEnum.buttonClick,
      label: label,
    );
  }

  Future<void> setUserId(String useId) {
    return provider.setUserId(useId);
  }
}
