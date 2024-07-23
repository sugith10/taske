import 'package:flutter/material.dart';
import 'package:todo/core/route/route_name/route_name.dart';
import 'package:todo/feature/auth/presentation/pages/sign_in_page.dart';
import 'package:todo/feature/auth/presentation/pages/sign_up_page.dart';

import '../../feature/onboarding/presentation/pages/splash_page.dart';
import 'page_transition/app_page_transition.dart';

class AppRoute {
  AppRoute._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.initial:
        return noMovement(const SplashPage());
      case RouteName.signIn:
        return noMovement(const SignInPage());
      case RouteName.signUp:
        return noMovement(const SignUpPage());
      default:
        return MaterialPageRoute(builder: (context) => const SplashPage());
    }
  }
}
