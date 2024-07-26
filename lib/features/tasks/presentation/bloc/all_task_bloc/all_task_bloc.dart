import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taske/core/util/app_exception.dart';
import 'package:taske/features/tasks/domain/entities/task_entity.dart';

import '../../../domain/usecases/get_all_task_usecase.dart';
import '../../../domain/usecases/get_local_tasks_usecase.dart';

part 'all_task_event.dart';
part 'all_task_state.dart';

/// Bloc for managing Get all task-related states and events.
class AllTaskBloc extends Bloc<TaskEvent, TaskState> {
  final GetAllTaskUseCase getAllTaskUseCase;
  final GetLocalTaskUseCase getLocalTaskUseCase;

  /// Initializes the bloc with the required use cases and sets the initial state.
  AllTaskBloc({
    required this.getAllTaskUseCase,
    required this.getLocalTaskUseCase,
  }) : super(AllTaskLoadingState()) {
    on<TaskGetAllEvent>(_getAll);
  }

  /// Handles `TaskGetAllEvent`, fetching tasks based on network connectivity.
  /// If no network connection is found, fetches tasks from local storage.
  _getAll(TaskGetAllEvent event, Emitter<TaskState> emit) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      emit(const AllTaskErrorState("Check network connection"));
      try {
        final task = await getLocalTaskUseCase.call();
        emit(AllTaskLoadedState(task));
      } on AppException catch (e) {
        emit(AllTaskErrorState(e.toString()));
      }
    } else {
      try {
        final task = await getAllTaskUseCase.call();
        emit(AllTaskLoadedState(task));
      } catch (e) {
        emit(AllTaskErrorState(e.toString()));
      }
    }
  }
}
