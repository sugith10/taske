import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taske/core/route/route_name/route_name.dart';

import '../../../../core/asset_path/app_asset.dart';
import '../../../../core/theme/color/app_color.dart';
import '../bloc/onboarding_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
        if (state is OnboardingSignState) {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteName.home, (_) => false);
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.primary,
        body: Center(
          child: SvgPicture.asset(
            AppAsset.appLogo,
            width: 250,
          ),
        ),
      ),
    );
  }
}
