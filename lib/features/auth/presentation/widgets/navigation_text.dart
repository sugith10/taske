import 'package:flutter/material.dart';

class NavigationText extends StatelessWidget {
  final String leadingText;
  final String buttonText;
  final VoidCallback onTap;

  const NavigationText({
    super.key,
    required this.leadingText,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: RichText(
        text: TextSpan(
          text: '$leadingText ',
          style: Theme.of(context).textTheme.bodyMedium,
          children: [
            TextSpan(
              text: buttonText,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    decorationColor: const Color.fromARGB(255, 122, 122, 122),
                    decoration: TextDecoration.underline,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
