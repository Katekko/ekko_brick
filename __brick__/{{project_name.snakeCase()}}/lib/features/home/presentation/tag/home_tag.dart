import '../../../../core/base/analytics/analytics_base.dart';
import '../../../../core/base/crashlytics/crashlytics_provider.dart';
import '../../../../core/base/inject.dart';

class HomeTag extends AnalyticsBase {
  const HomeTag(super.analyticsProvider);

  @override
  String get category => 'home';

  /// Removing user id from analytics and crashlytics
  Future<void> onLogout() async {
    setUserId(null);
    Inject.find<CrashlyticsProvider>().setUserIdentifier('');
  }
}
