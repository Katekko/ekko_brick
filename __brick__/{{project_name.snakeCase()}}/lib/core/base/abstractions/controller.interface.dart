import '../../../features/shared/loading/loading.interface.dart';
import '../inject.dart';

abstract class IController {
  ILoadingController get loading => Inject.find();

  void dispose();
}
