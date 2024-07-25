part of 'get_user_bloc.dart';

sealed class GetUserState extends Equatable {
  const GetUserState();
  
  @override
  List<Object> get props => [];
}

final class GetUserInitial extends GetUserState {}
