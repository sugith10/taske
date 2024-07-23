part of 'onboarding_bloc.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();  

  @override
  List<Object> get props => [];
}
final class OnboardingInitial extends OnboardingState {}

final class OnboardingSignState extends OnboardingState{}

final class OnboardingHomeState extends OnboardingState{}
