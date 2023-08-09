import '../../../core/resources/user/domain/user_repository.interface.dart';

class AuthenticateUserUsecase {
  final IUserRepository loginRepository;
  const AuthenticateUserUsecase({required this.loginRepository});

  Future<void> call({
    required String login,
    required String password,
  }) async {
    final response = await loginRepository.authenticate(
      login: login,
      password: password,
    );

    await loginRepository.save(response.user);
    await loginRepository.saveToken(response.token);
  }
}
