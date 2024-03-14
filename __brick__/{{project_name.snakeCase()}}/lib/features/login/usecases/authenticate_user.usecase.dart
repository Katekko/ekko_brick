import '../../../core/resources/user/domain/user_repository.interface.dart';

class AuthenticateUserUsecase {
  final IUserRepository userRepository;
  const AuthenticateUserUsecase({required this.userRepository});

  Future<void> call({
    required String login,
    required String password,
  }) async {
    final response = await userRepository.authenticate(
      login: login,
      password: password,
    );

    await userRepository.save(response.user);
    await userRepository.saveToken(response.token);
  }
}
