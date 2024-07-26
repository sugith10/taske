part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final User user;
  const AuthSuccessState({required this.user});
}

class AuthFailState extends AuthState {
  final String message;
  const AuthFailState({required this.message});
}

class AuthSignOutState extends AuthState{}
