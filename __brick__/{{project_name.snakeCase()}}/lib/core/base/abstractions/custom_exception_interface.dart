import '../dal/data/error.data.dart';

abstract class CustomException implements Exception {
  ErrorData get failure;
}
