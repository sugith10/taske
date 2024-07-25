import 'package:flutter/material.dart';

import '../../../../core/theme/color/app_color.dart';

class CreateContainer extends StatelessWidget {
  final Widget child;
  final String title;
  const CreateContainer({
    required this.title,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.primaryText),
              borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.all(10),
          child: child,
        ),
      ],
    );
  }
}
