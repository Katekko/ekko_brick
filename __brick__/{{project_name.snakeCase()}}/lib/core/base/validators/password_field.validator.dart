import 'package:equatable/equatable.dart';

import '../abstractions/validators/field_validator.interface.dart';
import '../mixins/l10n.mixin.dart';

class PasswordFieldValidator<T> extends Equatable
    with l10nMixin
    implements IFieldValidator<T> {
  @override
  String? validate(T? value) {
    final message = l10n.strings.validators.invalidPassword;
    if (value == null) return message;
    if (value is String && value.length < 6) return message;

    return null;
  }

  @override
  List<Object?> get props => [];
}
