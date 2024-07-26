part of 'task_users_bloc.dart';

sealed class TaskUsersEvent extends Equatable {
  const TaskUsersEvent();

  @override
  List<Object> get props => [];
}


final class GetAllUsersEvent extends TaskUsersEvent{}