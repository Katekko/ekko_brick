import 'analytics_provider.dart';
import 'send_event.mixin.dart';

abstract class AnalyticsBase with SendEventMixin {
  final AnalyticsProvider analyticsProvider;
  const AnalyticsBase(this.analyticsProvider);

  @override
  AnalyticsProvider get provider => analyticsProvider;
}
