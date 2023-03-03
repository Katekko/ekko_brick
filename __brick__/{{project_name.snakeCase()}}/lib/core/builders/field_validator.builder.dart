import '../abstractions/validators/field_validator.interface.dart';
import '../validators/required_field.validator.dart';

class FieldValidatorBuilder<T> {
  final List<IFieldValidator<T>> _validators = [];

  FieldValidatorBuilder<T> required() {
    _validators.add(RequiredFieldValidator<T>());
    return this;
  }

  List<IFieldValidator<T>> build() => _validators;
}
