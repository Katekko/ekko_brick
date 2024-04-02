import '../../../../core/base/analytics/analytics_base.dart';
import '../../../../core/base/crashlytics/crashlytics_provider.dart';
import '../../../../core/base/inject.dart';

class LoginTag extends AnalyticsBase {
  const LoginTag(super.analytics);

  @override
  String get category => 'login';

  Future<void> onLoginButtonClicked(String label) async {
    sendClickEvent(label);
  }

  Future<void> onLoginSucceed(String userId) async {
    await provider.setUserId(userId);
    Inject.find<CrashlyticsProvider>().setUserIdentifier(userId);
  }
}
