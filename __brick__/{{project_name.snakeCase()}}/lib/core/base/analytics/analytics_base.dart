import 'analytics_provider.dart';
import '../mixins/send_event_mixin.dart';

abstract class AnalyticsBase with SendEventMixin {
  final AnalyticsProvider analyticsProvider;
  const AnalyticsBase(this.analyticsProvider);

  @override
  AnalyticsProvider get provider => analyticsProvider;
}
