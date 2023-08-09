import '../../../../core/base/abstractions/controller.interface.dart';

abstract class IHomeController extends IController {
  Future<void> logout();
}
