import '../../../../core/base/abstractions/field.interface.dart';
import '../../shared/loading/loading.interface.dart';
import '../binding/login_controller.interface.dart';
import '../usecases/authenticate_user.usecase.dart';

class LoginController implements ILoginController {
  final AuthenticateUserUsecase authenticateUserUsecase;
  final IField<String> _loginField;
  final IField<String> _passwordField;
  final ILoadingController loading;

  @override
  IField<String> get loginField => _loginField;

  @override
  IField<String> get passwordField => _passwordField;

  LoginController({
    required IField<String> loginField,
    required IField<String> passwordField,
    required this.authenticateUserUsecase,
    required this.loading,
  })  : _loginField = loginField,
        _passwordField = passwordField;

  @override
  Future<void> authenticateUser() async {
    try {
      loading.isLoading = true;
      if (validateFields) {
        await authenticateUserUsecase(
          login: _loginField.valueNotifier.value!,
          password: _passwordField.valueNotifier.value!,
        );
      }
    } finally {
      loading.isLoading = false;
    }
  }

  bool get validateFields {
    _loginField.validate();
    _passwordField.validate();

    return !_loginField.hasError && !_passwordField.hasError;
  }

  @override
  void dispose() {
    _loginField.dispose();
    _passwordField.dispose();
  }
}
