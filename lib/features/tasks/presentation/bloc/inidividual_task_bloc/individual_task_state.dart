part of 'individual_task_bloc.dart';

sealed class IndividualTaskState extends Equatable {
  const IndividualTaskState();
  
  @override
  List<Object> get props => [];
}

final class IndividualTaskInitial extends IndividualTaskState {}

final class TaskLoadingState extends IndividualTaskState {}


final class TaskErrorState extends IndividualTaskState {
  final String message;

  const TaskErrorState(this.message);
}

final class TaskSuccessState extends IndividualTaskState {
  final String message;

  const TaskSuccessState(this.message);
}