import '../../../../base/abstractions/custom_exception.interface.dart';
import '../../../../base/dal/data/error.data.dart';

class UserOrPasswordIncorrectException implements CustomException {
  final ErrorData _failure;

  @override
  ErrorData get failure => _failure;

  UserOrPasswordIncorrectException({required ErrorData failure})
      : _failure = failure;
}
