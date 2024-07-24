import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
   final String? Function(String?)? validator;
  const AuthTextField({
    required this.validator,
    this.obscureText =false,
    required this.keyboardType,
    required this.controller,
    required this.iconData,
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      decoration:
          InputDecoration(hintText: hintText, prefixIcon: Icon(iconData)),
    );
  }
}
