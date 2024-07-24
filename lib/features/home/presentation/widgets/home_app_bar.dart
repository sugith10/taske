import 'package:flutter/material.dart';

import '../../../../core/asset_path/app_asset.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      title: const Text('Hey! Sugith'),
      floating: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconButton(
            onPressed: () {},
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
