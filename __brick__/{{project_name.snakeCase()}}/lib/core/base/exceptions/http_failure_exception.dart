class HttpFailureException<T> implements Exception {
  final T object;
  HttpFailureException({required this.object});
}
