import 'contexts/login_screen.strings.dart';
import 'contexts/validators.strings.dart';
import 'translation.dart';

class PtBrStringsTranslations implements StringsTranslations {
  static const String getLocale = 'pt_BR';

  static const title = 'Ekko Brick';

  final login = LoginScreenStrings(
    title: title,
    userNameLabel: 'E-mail',
    passwordLabel: 'Senha',
    loginButtonLabel: 'Entrar',
  );

  final validators = ValidatorsStrings(
    emailIsInvalid: 'Formato de email inválido',
    emailIsRequired: 'Email é obrigatório',
    invalidPassword: 'Senha inválida: Pelo menos 6 caracteres',
    required: 'Campo é obrigatório',
  );

  @override
  StringsI18n get strings {
    return StringsI18n(
      login: login,
      validators: validators,
    );
  }
}
