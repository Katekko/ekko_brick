abstract class ILoadingController {
  Stream<bool> get isLoadingStream;
  set isLoading(bool val);

  void dispose();
}
