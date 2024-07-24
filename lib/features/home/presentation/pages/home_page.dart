import 'package:flutter/material.dart';
import 'package:taske/core/route/route_name/route_name.dart';

import '../widgets/create_floating_action_button.dart';
import '../widgets/home_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HomeAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text('Item $index'),
              ),
              childCount: 100,
            ),
          ),
        ],
      ),
      floatingActionButton: const CreateFloatingActionButton(),
    );
  }
}
