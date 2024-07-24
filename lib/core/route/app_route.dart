import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/sign_in_page.dart';
import '../../features/auth/presentation/pages/sign_up_page.dart';
import '../../features/auth/presentation/pages/welcome_page.dart';
import '../../features/home/presentation/pages/create_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/onboarding/presentation/pages/splash_page.dart';
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
      case RouteName.create:
        if (settings.arguments is Map<String, dynamic>) {
          final args = settings.arguments as Map<String, dynamic>;
          final origin = args['origin'] as Offset?;
          if (origin != null) {
            return FloatingButtonRevealRoute(
              page: const CreatePage(),
              origin: origin,
            );
          }
        }
        // Fallback to default transition if no origin provided
        return bottomToTop(const CreatePage());

      default:
        return MaterialPageRoute(builder: (context) => const SplashPage());
    }
  }
}
