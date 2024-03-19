import '../inject.dart';
import 'analytics_base.dart';

mixin AnalyticsMixin<T extends AnalyticsBase> {
  T get tag => Inject.find<T>();
}
