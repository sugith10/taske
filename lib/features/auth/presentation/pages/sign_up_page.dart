import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taske/core/route/route_name/route_name.dart';

import '../../../../core/theme/color/app_color.dart';
import '../../../../core/util/app_padding.dart';
import '../../../../core/widget/default_app_bar.dart';
import '../../../../core/widget/snack_message.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/auth_button.dart';
import '../widgets/navigation_text.dart';
import '../widgets/sign_in_form_widget.dart';
import '../widgets/welcome_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _signIn() {
    context.read<AuthBloc>().add(
          AuthSignUpEvent(
            email: _emailController.text,
            password: _passwordController.text,
            confirmPassword: _confirmPasswordController.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteName.main, (_) => false);
        }
        if (state is AuthFailState) {
          AppSnackBar.show(
            context: context,
            message: state.message,
          );
        }
      },
      child: Scaffold(
        appBar: const DefaultAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.home),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.04),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: WelcomeTextWidget(
                    text: "New here?\nWelcome aboard.\nLet's get started!",
                  ),
                ),
                const SizedBox(height: 40),
                SignUpFormWidget(
                  formKey: formKey,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController,
                ),
                const SizedBox(height: 40),
                AuthButton(
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                       if (state is AuthLoadingState) {
                       return const CupertinoActivityIndicator(
                        color: AppColor.bg,
                      );
                    }
                      return const Text("Register");
                    },
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _signIn();
                    }
                  },
                ),
                const SizedBox(height: 20),
                NavigationText(
                  leadingText: 'Have an account?',
                  buttonText: 'Login',
                  onTap: () => Navigator.pushNamed(context, RouteName.signIn),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
