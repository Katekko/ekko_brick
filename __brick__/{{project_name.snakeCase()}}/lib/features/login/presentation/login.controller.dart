import '../../../../core/base/abstractions/field.interface.dart';
import '../../../core/base/abstractions/controller.interface.dart';
import '../../shared/loading/loading.interface.dart';
import '../usecases/authenticate_user.usecase.dart';

class LoginController implements IController {
  final AuthenticateUserUsecase _authenticateUserUsecase;
  final IField<String> loginField;
  final IField<String> passwordField;
  final ILoadingController _loading;

  LoginController({
    required this.loginField,
    required this.passwordField,
    required AuthenticateUserUsecase authenticateUserUsecase,
    required ILoadingController loading,
  })  : _authenticateUserUsecase = authenticateUserUsecase,
        _loading = loading;

  Future<bool> authenticateUser() async {
    try {
      _loading.isLoading = true;
      if (_validateFields) {
        await _authenticateUserUsecase(
          login: loginField.valueNotifier.value!,
          password: passwordField.valueNotifier.value!,
        );

        return true;
      }

      return false;
    } finally {
      _loading.isLoading = false;
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
