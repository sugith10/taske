import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taske/core/route/route_name/route_name.dart';

import '../../../../core/widget/snack_message.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../bloc/all_task_bloc/all_task_bloc.dart';
import '../widgets/home_floating_action_button.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/list_tile_widget.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AllTaskBloc, TaskState>(
          listener: (context, state) {
            if (state is AllTaskErrorState) {
              AppSnackBar.show(context: context, message: state.message);
            }

            if (state is TaskNetworkErrorState) {
              Navigator.pushNamed(context, RouteName.networkError);
            }
          },
        ),
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSignOutState) {
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteName.welcome, (_) => false);
            }
          },
        ),
      ],
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            // Trigger a refresh of the tasks
            context.read<AllTaskBloc>().add(TaskGetAllEvent());
          },
          child: BlocBuilder<AllTaskBloc, TaskState>(
            builder: (context, state) {
              if (state is AllTaskLoadedState) {
                return CustomScrollView(
                  slivers: [
                    const HomeAppBar(
                      title: "Task Manager",
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => ListTile(
                          title: TaskTileWidget(
                            task: state.tasks[index],
                          ),
                        ),
                        childCount: state.tasks.length,
                      ),
                    ),
                  ],
                );
              }

              return const Center(child: CircularProgressIndicator());
            },
            buildWhen: (previous, current) {
              return current is AllTaskLoadedState ||
                  current is AllTaskLoadingState;
            },
          ),
        ),
        floatingActionButton: const HomeFloatingActionButton(),
      ),
    );
  }
}
