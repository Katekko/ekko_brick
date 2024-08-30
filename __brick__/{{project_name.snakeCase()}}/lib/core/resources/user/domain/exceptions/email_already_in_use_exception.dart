import '../../../../base/abstractions/custom_exception_interface.dart';
import '../../../../base/dal/data/error_model.dart';

class EmailAlreadyInUseException implements CustomException {
  final ErrorModel _failure;

  @override
  ErrorModel get failure => _failure;

  EmailAlreadyInUseException({required ErrorModel failure}) : _failure = failure;
}
