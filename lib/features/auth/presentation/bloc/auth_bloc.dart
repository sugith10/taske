import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthSignInEvent>(_login);
    on<AuthSignUpEvent>(_signUp);
  }

  _login(AuthSignInEvent event, Emitter<AuthState> emit) async {
    // print(event.email);
    // print(event.password);
     emit(AuthSuccessState());
    // emit(const AuthFailState(message: "Something went wrong"));
  }

  _signUp(AuthSignUpEvent event, Emitter<AuthState> emit) async {
    // print(event.email);
    // print(event.password);
    // print(event.confirmPassword);
    emit(AuthSuccessState());
    // emit(const AuthFailState(message: "Something went wrong"));
  }
}
