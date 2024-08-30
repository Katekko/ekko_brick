import 'package:equatable/equatable.dart';

import '../abstractions/validators/field_validator.interface.dart';
import '../mixins/l10n.mixin.dart';

class EmailFieldValidator<T> extends Equatable
    with l10nMixin
    implements IFieldValidator<T> {
  bool isValidEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  @override
  String? validate(T? value) {
    final email = value as String?;
    if (email == null || email.isEmpty) {
      return l10n.strings.validators.emailIsRequired;
    }

    if (!isValidEmail(email)) {
      return l10n.strings.validators.emailIsInvalid;
    }

    return null;
  }

  @override
  List<Object?> get props => [];
}
