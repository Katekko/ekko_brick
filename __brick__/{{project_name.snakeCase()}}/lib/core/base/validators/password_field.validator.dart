import 'package:equatable/equatable.dart';

import '../../i18n/translation.dart';
import '../../inject.dart';
import '../abstractions/validators/field_validator.interface.dart';

class PasswordFieldValidator<T> extends Equatable
    implements IFieldValidator<T> {
  final i18n = Inject.find<StringsTranslations>().strings.validators;

  @override
  String? validate(T? value) {
    final message = i18n.invalidPassword;
    if (value == null) return message;
    if (value is String && value.length < 6) return message;

    return null;
  }

  @override
  List<Object?> get props => [];
}
