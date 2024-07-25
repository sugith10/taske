import '../entities/user.dart';
import '../repositories/auth_repo.dart';

class UserRegisterUseCase {
  final AuthRepository _authRepository;

  UserRegisterUseCase(this._authRepository);

  Future<User> call(String email, String password) async {
    return await _authRepository.registerUser(
      email: email,
      password: password,
    );
  }
}
