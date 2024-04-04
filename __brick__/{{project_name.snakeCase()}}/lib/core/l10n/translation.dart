import 'contexts/login_screen.strings.dart';
import 'contexts/home_screen.strings.dart';
import 'contexts/validators.strings.dart';

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
