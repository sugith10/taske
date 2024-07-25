import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/domain/entities/user.dart';
import '../../../auth/domain/usecases/get_user.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final GetUserUseCase _getUserUseCase;
  OnboardingBloc(this._getUserUseCase) : super(OnboardingInitial()) {
    on<OnboardingEvent>(_onOnboarding);
    add(const OnboardingEvent());
  }

  _onOnboarding(OnboardingEvent event, Emitter<OnboardingState> emit) async {
    await Future.delayed(const Duration(seconds: 2), () async {
      try {
        User? user = await _getUserUseCase.call();
        if (user != null) {
          emit(OnboardingHomeState());
        } else {
          emit(OnboardingSignState());
        }
      } catch (e) {
        emit(OnboardingSignState());
      }
    });
  }
}
