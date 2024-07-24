import 'package:flutter/material.dart';

import 'navigation_text.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          NavigationText(
            leadingText: "By proceeding, I accept Taske",
            buttonText: 'T&C',
            onTap: () {},
          ),
          NavigationText(
            leadingText: "and",
            buttonText: 'Privacy Policy.',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
