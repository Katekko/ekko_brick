import '../../../../core/base/analytics/analytics_base.dart';

class LogoutDialogTag extends AnalyticsBase {
  const LogoutDialogTag(super.analyticsProvider);

  @override
  String get category => 'home:logout-dialog';

  Future<void> onClickYesLogout(String label) async {
    sendButtonClick(label);
  }

  Future<void> onClickNoLogout(String label) async {
    sendButtonClick(label);
  }
}
