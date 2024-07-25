import 'package:flutter/material.dart';
import 'package:taske/features/tasks/domain/entities/task_entity.dart';
import 'package:taske/features/tasks/presentation/pages/network_error_page.dart';
import 'package:taske/features/tasks/presentation/pages/view_task_page.dart';

import '../../features/auth/presentation/pages/sign_in_page.dart';
import '../../features/auth/presentation/pages/sign_up_page.dart';
import '../../features/auth/presentation/pages/welcome_page.dart';
import '../../features/tasks/presentation/pages/create_page.dart';
import '../../features/onboarding/presentation/pages/splash_page.dart';
import '../../features/tasks/presentation/pages/home_page.dart';
import 'page_transition/app_page_transition.dart';
import 'route_name/route_name.dart';

class AppRoute {
  AppRoute._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.initial:
        return noMovement(const SplashPage());
      case RouteName.welcome:
        return noMovement(const WelocmePage());
      case RouteName.signIn:
        return bottomToTop(const SignInPage());
      case RouteName.signUp:
        return bottomToTop(const SignUpPage());
      case RouteName.home:
        return noMovement(const HomePage());
      case RouteName.viewTask:
        final Task task = settings.arguments as Task;
        return rightToLeft(ViewTaskPage(
          task: task,
        ));
      case RouteName.create:
        final Task? task = settings.arguments as Task?;
        return rightToLeft(CreatePage(task: task));
      case RouteName.networkError:
        return noMovement(const NetworkErrorPage());

      default:
        return MaterialPageRoute(builder: (context) => const SplashPage());
    }
  }
}
