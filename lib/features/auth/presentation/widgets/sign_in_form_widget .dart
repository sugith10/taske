
import 'package:flutter/material.dart';

import '../../../../core/util/app_reg_exp.dart';
import 'auth_text_field.dart';

class SignInFormWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const SignInFormWidget({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AuthTextField(
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            hintText: "Email",
            iconData: Icons.mail_outline_rounded,
            validator: (val) {
              if (val!.isEmpty) {
                return "Please fill in this Field.";
              } else if (!AppRegExp.emailRexExp.hasMatch(val)) {
                return "Please enter a valid email";
              } else if (val.length < 6) {
                return "Password should be at least 6 characters long.";
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          AuthTextField(
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            controller: passwordController,
            hintText: "Password",
            iconData: Icons.password_rounded,
            validator: (val) {
              if (val!.isEmpty) {
                return "Please fill in this Field.";
              } else if (val.length < 6) {
                return "Password should be at least 6 characters long.";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
