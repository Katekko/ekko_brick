import 'contexts/login_screen_strings.dart';
import 'contexts/home_screen_strings.dart';
import 'contexts/validators_strings.dart';

class Stringsl10n {
  final LoginScreenStrings login;
  final HomeScreenStrings home;
  final ValidatorsStrings validators;

  Stringsl10n({
    required this.login,
    required this.home,
    required this.validators,
  });
}

abstract class StringsTranslations {
  Stringsl10n get strings;
}
