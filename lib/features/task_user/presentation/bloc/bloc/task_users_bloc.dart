import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taske/features/task_user/domain/entities/task_user.dart';

import '../../../domain/usecases/get_task_users_use_case.dart';

part 'task_users_event.dart';
part 'task_users_state.dart';

class TaskUsersBloc extends Bloc<TaskUsersEvent, TaskUsersState> {
  final GetTaskUsersUseCase getTaskUsersUseCase;
  TaskUsersBloc({required this.getTaskUsersUseCase})
      : super(TaskUsersInitial()) {
    on<GetAllUsersEvent>(_getAll);
  }
  _getAll(GetAllUsersEvent event, Emitter<TaskUsersState> emit) async {
    emit(TaskUserLoading());
    try {
      final result = await getTaskUsersUseCase();
      emit(TaskUserLoaded(result));
    } catch (e) {
      TaskUserError(e.toString());
    }
  }
}
