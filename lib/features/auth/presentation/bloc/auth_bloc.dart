import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taske/core/util/app_exception.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/user_login.dart';
import '../../domain/usecases/user_register.dart';
import '../../domain/usecases/user_sign_out.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserLoginUseCase userLoginUseCase;
  final UserRegisterUseCase userRegisterUseCase;
  final UserSignOutUseCase userSignOutUseCase;
  AuthBloc({
    required this.userLoginUseCase,
    required this.userRegisterUseCase,
    required this.userSignOutUseCase,
  }) : super(AuthInitial()) {
    on<AuthSignInEvent>(_login);
    on<AuthSignUpEvent>(_signUp);
    on<AuthSignOutEvent>(_signOut);
  }

  _login(AuthSignInEvent event, Emitter<AuthState> emit) async {
    try {
      final User user =
          await userLoginUseCase.call(event.email, event.password);
      emit(AuthSuccessState(user: user));
    } on AppException catch (e) {
      emit(AuthFailState(message: e.message));
      emit(AuthInitial());
    }
  }

  _signUp(AuthSignUpEvent event, Emitter<AuthState> emit) async {
    if (event.password != event.confirmPassword) {
      emit(const AuthFailState(message: 'Password does not match'));
      emit(AuthInitial());
      return;
    }

    try {
      final User user =
          await userRegisterUseCase.call(event.email, event.password);
      emit(AuthSuccessState(user: user));
    } on AppException catch (e) {
      emit(AuthFailState(message: e.message));
      emit(AuthInitial());
    }
  }

  _signOut(AuthSignOutEvent event, Emitter<AuthState> emit) async {
    try {
      await userSignOutUseCase.call();
      emit(AuthSignOutState());
      emit(AuthInitial());
    } catch (e) {
      log(e.toString());
    }
  }
}
