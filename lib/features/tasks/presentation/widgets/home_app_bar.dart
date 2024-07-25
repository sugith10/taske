import 'package:flutter/material.dart';

import '../../../../core/asset_path/app_asset.dart';
import '../util/task_util.dart';
import '../../../auth/presentation/widgets/log_out_dialog.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      title: Text(TaskUtil.getGreeting()),
      floating: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconButton(
            onPressed: () => showLogoutDialog(context),
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                AppAsset.test,
                width: 40,
                height: 40,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
