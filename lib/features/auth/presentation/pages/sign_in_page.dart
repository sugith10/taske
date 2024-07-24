import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taske/core/route/route_name/route_name.dart';

import '../../../../core/util/app_padding.dart';
import '../../../../core/widget/default_app_bar.dart';
import '../../../../core/widget/snack_message.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/auth_button.dart';
import '../widgets/navigation_text.dart';
import '../widgets/sign_in_form_widget .dart';
import '../widgets/welcome_text.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() {
    context.read<AuthBloc>().add(AuthSignInEvent(
          email: _emailController.text,
          password: _passwordController.text,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteName.home, (_) => false);
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
                    text:
                        "Let's sign you in\nWelcome back.\nYou've been missed!",
                  ),
                ),
                const SizedBox(height: 40),
                SignInFormWidget(
                  formKey: _formKey,
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                const SizedBox(height: 40),
                AuthButton(
                    text: "Login",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _signIn();
                      }
                    }),
                const SizedBox(height: 20),
                NavigationText(
                  leadingText: 'Don\'t have an account?',
                  buttonText: 'Register',
                  onTap: () => Navigator.pushNamed(context, RouteName.signUp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
