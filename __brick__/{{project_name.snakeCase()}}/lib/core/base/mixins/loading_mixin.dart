import '../../../features/shared/loading/loading.controller.dart';
import '../inject.dart';

mixin LoadingMixin {
  LoadingController get loading => Inject.find();
}
