import 'package:flutter/material.dart';

import '../../../../core/theme/color/app_color.dart';

class CreateButton extends StatelessWidget {
  final Widget child;
  const CreateButton({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const ShapeDecoration(
        color: AppColor.create,
        shape: StadiumBorder(),
      ),
      child: child,
    );
  }
}