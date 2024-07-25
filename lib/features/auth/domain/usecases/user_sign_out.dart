import '../repositories/auth_repo.dart';

class UserSignOutUseCase {
  final AuthRepository _authRepository;

  UserSignOutUseCase(this._authRepository);

  Future<void> call() async {
    return await _authRepository.signOutUser();
  }
}
