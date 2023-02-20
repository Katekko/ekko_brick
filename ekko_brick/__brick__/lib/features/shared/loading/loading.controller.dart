import 'package:rxdart/rxdart.dart';

import 'loading.interface.dart';

class LoadingController implements ILoadingController {
  final _isLoading = BehaviorSubject<bool>.seeded(false);

  @override
  Stream<bool> get isLoadingStream => _isLoading.stream;

  @override
  set isLoading(bool val) => _isLoading.sink.add(val);

  @override
  void dispose() => _isLoading.close();
}
