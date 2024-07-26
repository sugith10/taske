part of 'all_task_bloc.dart';

@immutable
sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

final class TaskGetAllEvent extends TaskEvent {}

