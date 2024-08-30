import '../../../features/shared/loading/loading_controller.dart';
import '../inject.dart';

mixin LoadingMixin {
  LoadingController get loading => Inject.find();
}
