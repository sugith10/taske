import 'package:flutter/material.dart';

import '../../../../core/asset_path/app_asset.dart';
import '../../../../core/route/route_name/route_name.dart';

class CreateFloatingActionButton extends StatelessWidget {
  const CreateFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final RenderBox renderBox = context.findRenderObject() as RenderBox;
        final offset = renderBox.localToGlobal(Offset.zero);
        Navigator.of(context).pushNamed(
          RouteName.create,
          arguments: {'origin': offset + const Offset(28, 28)},
        );
      },
      child: Image.asset(
        AppAsset.add,
      ),
    );
  }
}
