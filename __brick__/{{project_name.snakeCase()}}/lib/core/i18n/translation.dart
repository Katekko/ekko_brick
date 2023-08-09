import 'contexts/login_screen.strings.dart';
import 'contexts/home_screen.strings.dart';
import 'contexts/validators.strings.dart';

class StringsI18n {
  final LoginScreenStrings login;
  final HomeScreenStrings home;
  final ValidatorsStrings validators;

  StringsI18n({
    required this.login,
    required this.home,
    required this.validators,
  });
}

abstract class StringsTranslations {
  StringsI18n get strings;
}
