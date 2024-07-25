import 'package:taske/features/auth/domain/entities/user.dart';

abstract interface class AuthRepository {
  /// This method is used to register a new user
  Future<User> registerUser({
    required String email,
    required String password,
  });

  /// This method is used to login a user
  Future<User> loginUser({
    required String email,
    required String password,
  });

  /// This method is used to login a user
  Future<User?> getUser();

  /// This method is used to logout a user
  Future<void> signOutUser();
}
