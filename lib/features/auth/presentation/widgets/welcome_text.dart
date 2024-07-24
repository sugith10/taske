
import 'package:flutter/material.dart';

class WelcomeTextWidget extends StatelessWidget {
  final String text;
  const WelcomeTextWidget({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}