import 'package:equatable/equatable.dart';

import '../abstractions/validators/field_validator_interface.dart';
import '../mixins/l10n_mixin.dart';

class RequiredFieldValidator<T> extends Equatable
    with L10nMixin
    implements IFieldValidator<T> {
  @override
  String? validate(T? value) {
    final message = l10n.strings.validators.required;
    if (value == null) return message;

    if (value is String && value.isEmpty) {
      return message;
    } else if ((value is int || value is double || value is num) &&
        (value == 0 || value == .0)) {
      return message;
    }

    return null;
  }

  @override
  List<Object?> get props => [];
}
