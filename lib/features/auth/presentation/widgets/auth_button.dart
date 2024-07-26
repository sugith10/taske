import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  const AuthButton({
    required this.child,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () =>
          {FocusManager.instance.primaryFocus?.unfocus(), onPressed()},
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 52.5)),
      child: child,
    );
  }
}
