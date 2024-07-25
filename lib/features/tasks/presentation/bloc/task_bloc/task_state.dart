part of 'task_bloc.dart';

@immutable
sealed class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object?> get props => [];
}

final class TaskInitial extends TaskState {}

final class TaskLoadingState extends TaskState {}
final class TaskGetAllLoadingState extends TaskState {}

final class TaskLoadedState extends TaskState {
  final List<Task> tasks;

  const TaskLoadedState(this.tasks);
}

final class TaskErrorState extends TaskState {
  final String message;

  const TaskErrorState(this.message);
}

final class TaskSuccessState extends TaskState {
  final String message;

  const TaskSuccessState(this.message);
}

final class TaskNetworkErrorState extends TaskState {}
