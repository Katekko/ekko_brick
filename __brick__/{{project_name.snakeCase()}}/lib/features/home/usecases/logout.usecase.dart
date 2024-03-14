import '../../../core/resources/user/dal/user.repository.dart';

class LogoutUsecase {
  final UserRepository userRepository;
  const LogoutUsecase({required this.userRepository});

  Future<void> call() async {
    await userRepository.clearData();
  }
}
