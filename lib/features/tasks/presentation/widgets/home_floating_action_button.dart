import 'package:flutter/material.dart';

import '../../../../core/asset_path/app_asset.dart';
import '../../../../core/route/route_name/route_name.dart';

class HomeFloatingActionButton extends StatelessWidget {
  const HomeFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed(
          RouteName.create,
        );
      },
      child: Image.asset(
        AppAsset.add,
      ),
    );
  }
}
