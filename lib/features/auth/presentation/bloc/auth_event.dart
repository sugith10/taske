part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthSignInEvent extends AuthEvent {
  final String email;
  final String password;

  const AuthSignInEvent({
    required this.email,
    required this.password,
  });
}

final class AuthSignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String confirmPassword;

  const AuthSignUpEvent({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}
