import '../entities/user.dart';
import '../repositories/auth_repo.dart';

class GetUserUseCase {
  final AuthRepository _authRepository;

  GetUserUseCase(this._authRepository);

  Future<User?> call() async {
    return await _authRepository.getUser();
  }
}
