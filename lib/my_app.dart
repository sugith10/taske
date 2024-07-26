import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:taske/features/auth/domain/usecases/user_sign_out.dart';
import 'package:taske/features/tasks/presentation/bloc/inidividual_task_bloc/individual_task_bloc.dart';

import 'core/observer/navigator_observer.dart';
import 'core/route/app_route.dart';
import 'core/route/route_name/route_name.dart';
import 'core/theme/theme.dart';
import 'features/auth/domain/usecases/get_user.dart';
import 'features/auth/domain/usecases/user_login.dart';
import 'features/auth/domain/usecases/user_register.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/navigation_menu/bloc/navigation_bloc.dart';
import 'features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'features/task_user/domain/usecases/get_task_users_use_case.dart';
import 'features/task_user/presentation/bloc/bloc/task_users_bloc.dart';
import 'features/tasks/domain/usecases/add_task_usecase.dart';
import 'features/tasks/domain/usecases/delete_task_usecase.dart';
import 'features/tasks/domain/usecases/get_all_task_usecase.dart';
import 'features/tasks/domain/usecases/get_local_tasks_usecase.dart';
import 'features/tasks/domain/usecases/update_task_usecase.dart';
import 'features/tasks/presentation/bloc/all_task_bloc/all_task_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final getIt = GetIt.instance;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => OnboardingBloc(
                  getIt.get<GetUserUseCase>(),
                )),
        BlocProvider(
          create: (context) => AuthBloc(
            userSignOutUseCase: getIt.get<UserSignOutUseCase>(),
            userLoginUseCase: getIt.get<UserLoginUseCase>(),
            userRegisterUseCase: getIt.get<UserRegisterUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) => AllTaskBloc(
            getAllTaskUseCase: getIt.get<GetAllTaskUseCase>(),
            getLocalTaskUseCase: getIt.get<GetLocalTaskUseCase>(),
          )..add(TaskGetAllEvent()),
        ),
        BlocProvider(
          create: (context) => IndividualTaskBloc(
            addTaskUsecase: getIt.get<AddTaskUseCase>(),
            deleteTaskUseCase: getIt.get<DeleteTaskUseCase>(),
            updateTaskUseCase: getIt.get<UpdateTaskUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) => TaskUsersBloc(
            getTaskUsersUseCase: getIt.get<GetTaskUsersUseCase>(),
          )..add(GetAllUsersEvent()),
        ),
        BlocProvider(create: (context) => NavigationBloc()),
      ],
      child: MaterialApp(
        title: 'Taske',
        theme: AppTheme().themeData,
        initialRoute: RouteName.initial,
        onGenerateRoute: AppRoute.generateRoute,
        navigatorObservers: [AppNavigatorObserver()],
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
