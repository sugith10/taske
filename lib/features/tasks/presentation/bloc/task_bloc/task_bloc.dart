import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taske/core/util/app_exception.dart';
import 'package:taske/features/tasks/domain/entities/task_entity.dart';

import '../../../data/datasources/remote/get_user_remote_data.dart';
import '../../../domain/usecases/add_task_usecase.dart';
import '../../../domain/usecases/delete_task_usecase.dart';
import '../../../domain/usecases/get_all_task_usecase.dart';
import '../../../domain/usecases/get_local_tasks_usecase.dart';
import '../../../domain/usecases/update_task_usecase.dart';

part 'task_event.dart';
part 'task_state.dart';

/// BLoC class responsible for managing state related to posts.
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final GetAllTaskUseCase getAllTaskUseCase;
  final AddTaskUseCase addTaskUsecase;
  final DeleteTaskUseCase deleteTaskUseCase;
  final UpdateTaskUseCase updateTaskUseCase;
  final GetLocalTaskUseCase getLocalTaskUseCase;

  TaskBloc({
    required this.getAllTaskUseCase,
    required this.getLocalTaskUseCase,
    required this.updateTaskUseCase,
    required this.deleteTaskUseCase,
    required this.addTaskUsecase,
  }) : super(TaskLoadingState()) {
    on<TaskGetAllEvent>(_getAll);
    add(TaskGetAllEvent());
    on<DeleteTaskEvent>(_delete);
    on<TaskAddEvent>(_add);
  }

  _getAll(TaskGetAllEvent event, Emitter<TaskState> emit) async {
    emit(TaskGetAllLoadingState());
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      emit(const TaskErrorState("Check network connection"));
      try {
        final task = await getLocalTaskUseCase.call();
        emit(TaskLoadedState(task));
      } on AppException catch (e) {
        emit(TaskErrorState(e.toString()));
      }
    } else {
      try {
        final task = await getAllTaskUseCase.call();
        emit(TaskLoadedState(task));
        emit(const TaskSuccessState("Succesfully loaded"));
        await GetUserRemoteData().getUser();
      } catch (e) {
        emit(TaskErrorState(e.toString()));
      }
    }
  }

  _delete(DeleteTaskEvent event, Emitter<TaskState> emit) async {
    emit(TaskLoadingState());
    try {
      await deleteTaskUseCase.call(event.id);
      emit(const TaskSuccessState("Deleted Successfully"));
    } catch (e) {
      emit(TaskErrorState(e.toString()));
    }
  }

  _add(TaskAddEvent event, Emitter<TaskState> emit) async {
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
    } else {
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
    emit(TaskInitial());
  }
}
