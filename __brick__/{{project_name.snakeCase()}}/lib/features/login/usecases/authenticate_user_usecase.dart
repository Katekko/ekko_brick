import '../../../core/resources/user/dal/user.repository.dart';

class AuthenticateUserUsecase {
  final UserRepository userRepository;
  const AuthenticateUserUsecase({required this.userRepository});

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
