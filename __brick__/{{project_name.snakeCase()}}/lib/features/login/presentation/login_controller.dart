import '../../../../core/base/abstractions/field_interface.dart';
import '../../../core/base/abstractions/controller_interface.dart';
import '../usecases/authenticate_user_usecase.dart';

class LoginController extends IController {
  LoginController({
    required this.loginField,
    required this.passwordField,
    required AuthenticateUserUsecase authenticateUserUsecase,
  }) : _authenticateUserUsecase = authenticateUserUsecase;

  final AuthenticateUserUsecase _authenticateUserUsecase;
  final IField<String> loginField;
  final IField<String> passwordField;

  Future<String?> authenticateUser() async {
    try {
      loading.isLoading = true;
      if (_validateFields) {
        final userId = await _authenticateUserUsecase(
          login: loginField.valueNotifier.value!,
          password: passwordField.valueNotifier.value!,
        );

        return userId;
      }

      return null;
    } finally {
      loading.isLoading = false;
    }
  }

  bool get _validateFields {
    loginField.validate();
    passwordField.validate();

    return !loginField.hasError && !passwordField.hasError;
  }

  @override
  void dispose() {
    loginField.dispose();
    passwordField.dispose();
  }
}
