part of 'task_users_bloc.dart';

sealed class TaskUsersState extends Equatable {
  const TaskUsersState();
  
  @override
  List<Object> get props => [];
}

final class TaskUsersInitial extends TaskUsersState {}

final class TaskUserLoading extends TaskUsersState {
  
}

final class TaskUserError extends TaskUsersState {
  final String message;
  const TaskUserError(this.message);
}

final class TaskUserLoaded extends TaskUsersState {
  final List<TaskUser> user;
  const TaskUserLoaded(this.user);
}
