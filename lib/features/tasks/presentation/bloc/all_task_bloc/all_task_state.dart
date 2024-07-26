part of 'all_task_bloc.dart';

@immutable
sealed class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object?> get props => [];
}

final class TaskInitial extends TaskState {}

final class AllTaskLoadingState extends TaskState {}

final class AllTaskLoadedState extends TaskState {
  final List<Task> tasks;

  const AllTaskLoadedState(this.tasks);
}

final class AllTaskErrorState extends TaskState {
  final String message;

  const AllTaskErrorState(this.message);
}

final class TaskNetworkErrorState extends TaskState {}
