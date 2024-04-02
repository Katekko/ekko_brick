import '../../../../core/base/analytics/analytics_base.dart';

class LogoutDialogTag extends AnalyticsBase {
  const LogoutDialogTag(super.analyticsProvider);

  @override
  String get category => 'home:dialog:logout';

  Future<void> onClickYesLogout(String label) async {
    sendClickEvent(label);
  }

  Future<void> onClickNoLogout(String label) async {
    sendClickEvent(label);
  }
}
