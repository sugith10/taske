import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/observer/navigator_observer.dart';
import 'core/route/app_route.dart';
import 'core/route/route_name/route_name.dart';
import 'core/theme/theme.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/onboarding/presentation/bloc/onboarding_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnboardingBloc()),
        BlocProvider(create: (context) => AuthBloc()),
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
