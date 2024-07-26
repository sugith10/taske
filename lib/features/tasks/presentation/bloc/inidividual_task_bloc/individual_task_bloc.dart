import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/task_entity.dart';
import '../../../domain/usecases/add_task_usecase.dart';
import '../../../domain/usecases/delete_task_usecase.dart';
import '../../../domain/usecases/update_task_usecase.dart';

part 'individual_task_event.dart';
part 'individual_task_state.dart';

class IndividualTaskBloc
    extends Bloc<IndividualTaskEvent, IndividualTaskState> {
  final DeleteTaskUseCase deleteTaskUseCase;
  final AddTaskUseCase addTaskUsecase;

  final UpdateTaskUseCase updateTaskUseCase;
  IndividualTaskBloc({
    required this.deleteTaskUseCase,
    required this.updateTaskUseCase,
    required this.addTaskUsecase,
  }) : super(IndividualTaskInitial()) {
    on<DeleteTaskEvent>(_delete);
    on<TaskAddEvent>(_add);
  }

  _delete(DeleteTaskEvent event, Emitter<IndividualTaskState> emit) async {
    emit(TaskLoadingState());
    try {
      await deleteTaskUseCase.call(event.id);
      emit(const TaskSuccessState("Deleted Successfully"));
    } catch (e) {
      emit(TaskErrorState(e.toString()));
    }
  }

  _add(TaskAddEvent event, Emitter<IndividualTaskState> emit) async {
    if (event.title.isEmpty) {
      emit(const TaskErrorState("Title is Empty"));
    } else if (event.description.isEmpty) {
      emit(const TaskErrorState("Description is Empty"));
    } else if (event.dateTime.isEmpty) {
      emit(const TaskErrorState("Date is Empty"));
    } else if (event.status.isEmpty) {
      emit(const TaskErrorState("Status is Empty"));
    } else if (event.priority.isEmpty) {
      emit(const TaskErrorState("Priority is Empty"));
    } else if (event.time.isEmpty) {
      emit(const TaskErrorState("Remaining time is Empty"));
    } else if (event.user.isEmpty) {
      emit(const TaskErrorState("User is Empty"));
    } 
    
    
    else {
      emit(TaskLoadingState());

      try {
        ///Update Case
        if (event.task != null) {
          try {
            await updateTaskUseCase.call(event.task!);
            emit(const TaskSuccessState("Task successfully updated"));
          } catch (e) {
            emit(TaskErrorState(e.toString()));
          }
        }

        ///Create Case
        else {
          try {
            await addTaskUsecase.call(
              description: event.description,
              title: event.description,
            );
            emit(const TaskSuccessState("Task successfully created"));
          } catch (e) {
            emit(TaskErrorState(e.toString()));
          }
        }

        emit(const TaskSuccessState("Updated Successfully"));
      } catch (e) {
        emit(TaskErrorState(e.toString()));
      }
    }
    emit(IndividualTaskInitial());
  }
}
