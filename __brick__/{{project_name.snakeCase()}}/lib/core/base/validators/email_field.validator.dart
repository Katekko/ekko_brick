import 'package:equatable/equatable.dart';

import '../../i18n/translation.dart';
import '../../inject.dart';
import '../abstractions/validators/field_validator.interface.dart';

class EmailFieldValidator<T> extends Equatable implements IFieldValidator<T> {
  final i18n = Inject.find<StringsTranslations>().strings.validators;

  bool isValidEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  @override
  String? validate(T? value) {
    final email = value as String?;
    if (email == null || email.isEmpty) {
      return i18n.emailIsRequired;
    }

    if (!isValidEmail(email)) {
      return i18n.emailIsInvalid;
    }

    return null;
  }

  @override
  List<Object?> get props => [];
}
