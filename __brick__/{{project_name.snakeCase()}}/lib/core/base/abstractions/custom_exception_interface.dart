import '../dal/data/error_model.dart';

abstract class CustomException implements Exception {
  ErrorModel get failure;
}
