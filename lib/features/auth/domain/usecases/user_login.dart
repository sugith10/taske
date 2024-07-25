import '../entities/user.dart';
import '../repositories/auth_repo.dart';

class UserLoginUseCase {
  final AuthRepository _authRepository;

  UserLoginUseCase(this._authRepository);

  Future<User> call(String email, String password) async {
    return await _authRepository.loginUser(
      email: email,
      password: password,
    );
  }
}
