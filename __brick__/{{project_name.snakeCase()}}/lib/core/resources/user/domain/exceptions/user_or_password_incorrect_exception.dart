import '../../../../base/abstractions/custom_exception_interface.dart';
import '../../../../base/dal/data/error_model.dart';

class UserOrPasswordIncorrectException implements CustomException {
  final ErrorModel _failure;

  @override
  ErrorModel get failure => _failure;

  UserOrPasswordIncorrectException({required ErrorModel failure})
      : _failure = failure;
}
