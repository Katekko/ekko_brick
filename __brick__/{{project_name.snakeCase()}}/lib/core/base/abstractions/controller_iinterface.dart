import '../mixins/loading.mixin.dart';

abstract class IController with LoadingMixin {
  void dispose();
}
