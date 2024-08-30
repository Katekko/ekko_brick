import '../abstractions/validators/field_validator.interface.dart';
import '../validators/email_field.validator.dart';
import '../validators/password_field.validator.dart';
import '../validators/required_field.validator.dart';

class FieldValidatorBuilder<T> {
  final List<IFieldValidator<T>> _validators = [];

  FieldValidatorBuilder<T> required() {
    _validators.add(RequiredFieldValidator<T>());
    return this;
  }

  FieldValidatorBuilder<T> password() {
    _validators.add(PasswordFieldValidator<T>());
    return this;
  }

  FieldValidatorBuilder<T> email() {
    _validators.add(EmailFieldValidator<T>());
    return this;
  }

  List<IFieldValidator<T>> build() => _validators;
}
