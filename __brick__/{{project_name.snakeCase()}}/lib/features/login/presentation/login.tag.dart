import '../../../core/base/analytics/analytics_base.dart';

class LoginTag extends AnalyticsBase {
  const LoginTag(super.analytics);

  @override
  String get category => 'login';

  Future<void> onLoginButtonClicked(String label) async {
    sendClickEvent(label);
  }

  Future<void> onLoginSucceed(String useId) async {
    await provider.setUserId(useId);
  }
}
