part of 'task_bloc.dart';

@immutable
sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

final class TaskGetAllEvent extends TaskEvent {}

final class DeleteTaskEvent extends TaskEvent {
  final int id;
  const DeleteTaskEvent(this.id);
}

final class TaskAddEvent extends TaskEvent {
  final Task? task;
  final String dateTime;
  final String title;
  final String description;
  final String priority;
  final String status;
  const TaskAddEvent({
    required this.dateTime,
    required this.title,
    required this.description,
    required this.priority,
    required this.status,
    required this.task,
  });
}
