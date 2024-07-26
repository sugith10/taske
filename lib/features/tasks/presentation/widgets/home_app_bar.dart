import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../auth/presentation/widgets/log_out_dialog.dart';

class HomeAppBar extends StatelessWidget {
  final String title;
  const HomeAppBar({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      title: Text(title),
      floating: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconButton(
            onPressed: () => showLogoutDialog(context),
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: const Icon(IconlyBroken.logout),
            ),
          ),
        ),
      ],
    );
  }
}
