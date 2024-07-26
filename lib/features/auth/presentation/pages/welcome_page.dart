import 'package:flutter/material.dart';

import '../../../../core/asset_path/app_asset.dart';
import '../../../../core/route/route_name/route_name.dart';
import '../../../../core/util/app_padding.dart';
import '../widgets/auth_button.dart';
import '../widgets/terms_and_conditions_widget.dart';
import '../widgets/welcome_text.dart';

class WelocmePage extends StatelessWidget {
  const WelocmePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.home),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.08),
                const WelcomeTextWidget(
                  text: "Manage your\ntask easily with taske...",
                ),
                const SizedBox(height: 40),
                Image.asset(AppAsset.welcome),
                const SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: AuthButton(
                    child: const Text("Login"),
                    onPressed: () =>
                        Navigator.pushNamed(context, RouteName.signIn),
                  ),
                ),
                const SizedBox(height: 40),
                const TermsAndConditionsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
