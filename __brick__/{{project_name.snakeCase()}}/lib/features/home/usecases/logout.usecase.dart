import '../../../core/resources/user/domain/user_repository.interface.dart';

class LogoutUsecase {
  final IUserRepository userRepository;
  const LogoutUsecase({required this.userRepository});

  Future<void> call() async {
    await userRepository.clearData();
  }
}
