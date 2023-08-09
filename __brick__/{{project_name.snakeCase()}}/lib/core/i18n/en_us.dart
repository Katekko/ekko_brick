import 'contexts/login_screen.strings.dart';
import 'contexts/home_screen.strings.dart';
import 'contexts/validators.strings.dart';
import 'translation.dart';

class EnUsStringsTranslations implements StringsTranslations {
  static const String getLocale = 'en-US';

  static const title = 'Ekko Brick';

  final login = LoginScreenStrings(
    title: title,
    userNameLabel: 'E-mail',
    passwordLabel: 'Password',
    loginButtonLabel: 'Join',
  );

  final home = HomeScreenStrings(
    title: title,
    logoutDialog: HomeLogoutDialogStrings(
      title: 'Are you sure?',
      content: 'Do you wanna logout?',
      buttonNo: 'NO',
      buttonYes: 'YES',
    ),
  );

  final validators = ValidatorsStrings(
    emailIsInvalid: 'Email is invalid',
    emailIsRequired: 'Email is required',
    invalidPassword: 'Password invalid: At least 6 characters',
    required: 'Field is required',
  );

  @override
  StringsI18n get strings {
    return StringsI18n(
      login: login,
      home: home,
      validators: validators,
    );
  }
}
