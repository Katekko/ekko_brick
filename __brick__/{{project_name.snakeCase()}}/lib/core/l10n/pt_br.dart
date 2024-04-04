import 'contexts/login_screen.strings.dart';
import 'contexts/home_screen.strings.dart';
import 'contexts/validators.strings.dart';
import 'translation.dart';

class PtBrStringsTranslations implements StringsTranslations {
  static const String getLocale = 'pt-BR';

  static const title = 'Ekko Brick';

  final login = LoginScreenStrings(
    title: title,
    userNameLabel: 'E-mail',
    passwordLabel: 'Senha',
    loginButtonLabel: 'Entrar',
  );

  final home = HomeScreenStrings(
    title: title,
    logoutDialog: HomeLogoutDialogStrings(
      title: 'Você tem certeza?',
      content: 'Você deseja sair do app?',
      buttonNo: 'NÃO',
      buttonYes: 'SIM',
    ),
  );

  final validators = ValidatorsStrings(
    emailIsInvalid: 'Formato de email inválido',
    emailIsRequired: 'Email é obrigatório',
    invalidPassword: 'Senha inválida: Pelo menos 6 caracteres',
    required: 'Campo é obrigatório',
  );

  @override
  Stringsl10n get strings {
    return Stringsl10n(
      login: login,
      home: home,
      validators: validators,
    );
  }
}
