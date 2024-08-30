import '../../../core/resources/user/dal/user_repository.dart';

class AuthenticateUserUsecase {
  const AuthenticateUserUsecase({required this.userRepository});

  final UserRepository userRepository;

  Future<String> call({
    required String login,
    required String password,
  }) async {
    final response = await userRepository.authenticate(
      login: login,
      password: password,
    );

    await userRepository.save(response.user);
    await userRepository.saveToken(response.token);

    return response.user.id;
  }
}
