import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../tasks/presentation/widgets/home_app_bar.dart';
import '../bloc/bloc/task_users_bloc.dart';
import '../widgets/task_user_list_tile.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TaskUsersBloc, TaskUsersState>(
        builder: (context, state) {
          if (state is TaskUserLoaded) {
            return CustomScrollView(
              slivers: [
                const HomeAppBar(
                  title: "User Manger",
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: TaskUserTileWidget(
                        taskUser: state.user[index],
                      ),
                    ),
                    childCount: state.user.length,
                  ),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
