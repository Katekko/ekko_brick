import '../inject.dart';

mixin ControllerMixin<T extends Object> {
  T get controller => Inject.find<T>();
}
