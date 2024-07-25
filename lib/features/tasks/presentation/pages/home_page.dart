import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taske/core/route/route_name/route_name.dart';

import '../../../../core/widget/snack_message.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../bloc/task_bloc/task_bloc.dart';
import '../widgets/home_floating_action_button.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/list_tile_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<TaskBloc, TaskState>(
          listener: (context, state) {
            if (state is TaskErrorState) {
              AppSnackBar.show(context: context, message: state.message);
            }
            if (state is TaskSuccessState) {
              AppSnackBar.show(
                  context: context, message: state.message, isError: false);
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
            context.read<TaskBloc>().add(TaskGetAllEvent());
          },
          child: BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              if (state is TaskLoadedState) {
                return CustomScrollView(
                  slivers: [
                    const HomeAppBar(),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => ListTile(
                          title: ListTileWidget(
                            task: state.tasks[index],
                          ),
                        ),
                        childCount: state.tasks.length,
                      ),
                    ),
                  ],
                );
              }
              if (state is TaskLoadedState) {
                return const Center(child: CircularProgressIndicator());
              }
              return const Center(child: CircularProgressIndicator());
            },
            buildWhen: (previous, current) {
              return current is TaskLoadedState ||
                  current is TaskGetAllLoadingState;
            },
          ),
        ),
        floatingActionButton: const HomeFloatingActionButton(),
      ),
    );
  }
}
