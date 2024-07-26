part of 'individual_task_bloc.dart';

sealed class IndividualTaskEvent extends Equatable {
  const IndividualTaskEvent();

  @override
  List<Object> get props => [];
}

 class DeleteTaskEvent extends IndividualTaskEvent{
  final int id;
  const DeleteTaskEvent(this.id);
 }

 final class TaskAddEvent extends IndividualTaskEvent {
  final Task? task;
  final String dateTime;
  final String title;
  final String description;
  final String priority;
  final String status;
  final String time;
  final String user;
  const TaskAddEvent({
    required this.dateTime,
    required this.title,
    required this.description,
    required this.priority,
    required this.status,
    required this.task,
     required this.time,
      required this.user,
  });
}
