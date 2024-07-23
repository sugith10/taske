import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial()) {
    on<OnboardingEvent>(_onOnboarding);
    add(const OnboardingEvent());
  }

  _onOnboarding(OnboardingEvent event, Emitter<OnboardingState> emit) async {
    await Future.delayed(const Duration(seconds: 2), () {
      emit(OnboardingSignState());
    });
  }
}
