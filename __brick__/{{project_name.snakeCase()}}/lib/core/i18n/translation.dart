import 'contexts/login_screen.strings.dart';
import 'contexts/validators.strings.dart';

class StringsI18n {
  final LoginScreenStrings login;
  final ValidatorsStrings validators;

  StringsI18n({
    required this.login,
    required this.validators,
  });
}

abstract class StringsTranslations {
  StringsI18n get strings;
}
