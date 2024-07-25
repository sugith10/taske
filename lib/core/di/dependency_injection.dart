import 'package:get_it/get_it.dart';
import 'package:taske/features/auth/domain/usecases/get_user.dart';

import '../../features/auth/data/datasources/local/auth_local_data.dart';
import '../../features/auth/data/datasources/remote/auth_remote_data.dart';
import '../../features/auth/data/mappers/user_mapper.dart';
import '../../features/auth/data/repositories/auth_repo_impl.dart';
import '../../features/auth/domain/repositories/auth_repo.dart';
import '../../features/auth/domain/usecases/user_login.dart';
import '../../features/auth/domain/usecases/user_register.dart';
import '../../features/auth/domain/usecases/user_sign_out.dart';
import '../../features/tasks/data/datasources/local/task_local_data.dart';
import '../../features/tasks/data/datasources/remote/task_remote_data.dart';
import '../../features/tasks/data/mappers/task_mapper.dart';
import '../../features/tasks/data/repositories/task_repository_impl.dart';
import '../../features/tasks/domain/repositories/post_repositroy.dart';
import '../../features/tasks/domain/usecases/add_task_usecase.dart';
import '../../features/tasks/domain/usecases/delete_task_usecase.dart';
import '../../features/tasks/domain/usecases/get_all_task_usecase.dart';
import '../../features/tasks/domain/usecases/get_local_tasks_usecase.dart';
import '../../features/tasks/domain/usecases/update_task_usecase.dart';

final class DependencyInjection {
  final _getIt = GetIt.instance;

  void setupDependencies() {
    ///Auth
    _getIt
      ..registerLazySingleton<AuthRemoteData>(() => AuthRemoteData())
      ..registerLazySingleton<AuthLocalData>(() => AuthLocalData())
      ..registerLazySingleton<AuthRepository>(() => AuthRepoImpl(
          _getIt<AuthRemoteData>(), _getIt<AuthLocalData>(), UserMapper()));
    //Auth Register UseCase
    _getIt.registerLazySingleton<UserRegisterUseCase>(
        () => UserRegisterUseCase(_getIt<AuthRepository>()));
    //Auth Login UseCase
    _getIt.registerLazySingleton<UserLoginUseCase>(
        () => UserLoginUseCase(_getIt<AuthRepository>()));
    // Auth GetUserCase
    _getIt.registerLazySingleton<GetUserUseCase>(
        () => GetUserUseCase(_getIt<AuthRepository>()));

    // Auth SignOutUseCase
    _getIt.registerLazySingleton<UserSignOutUseCase>(
        () => UserSignOutUseCase(_getIt<AuthRepository>()));

    ///Task
    _getIt
      ..registerLazySingleton<TaskRemoteData>(() => TaskRemoteData())
      ..registerLazySingleton<TaskLocalData>(() => TaskLocalData())
      ..registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl(
          _getIt<TaskRemoteData>(), _getIt<TaskLocalData>(), TaskMapper()))
      //Add Task UseCase
      ..registerLazySingleton<AddTaskUseCase>(
          () => AddTaskUseCase(_getIt<TaskRepository>()))
      //Delete Task UseCase
      ..registerLazySingleton<DeleteTaskUseCase>(
          () => DeleteTaskUseCase(_getIt<TaskRepository>()))
      //Get All Task UseCase
      ..registerLazySingleton<GetAllTaskUseCase>(
          () => GetAllTaskUseCase(_getIt<TaskRepository>()))
      //Get Single Task UseCase
      ..registerLazySingleton<GetLocalTaskUseCase>(
          () => GetLocalTaskUseCase(_getIt<TaskRepository>()))
      //Update Task UseCase
      ..registerLazySingleton<UpdateTaskUseCase>(
          () => UpdateTaskUseCase(_getIt<TaskRepository>()));
  }
}
