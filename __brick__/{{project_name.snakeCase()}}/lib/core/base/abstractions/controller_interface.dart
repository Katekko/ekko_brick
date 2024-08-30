import '../mixins/loading_mixin.dart';

abstract class IController with LoadingMixin {
  void dispose();
}
