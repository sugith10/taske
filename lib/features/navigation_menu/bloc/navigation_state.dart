part of 'navigation_bloc.dart';

sealed class NavigationState extends Equatable {
  const NavigationState();
  
  @override
  List<Object> get props => [];
}

class NavigationHomeState extends NavigationState {}

class NavigationUserState extends NavigationState{}