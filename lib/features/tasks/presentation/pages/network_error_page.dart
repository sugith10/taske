import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taske/core/route/route_name/route_name.dart';

import '../../../../core/widget/snack_message.dart';
import '../bloc/all_task_bloc/all_task_bloc.dart';

class NetworkErrorPage extends StatelessWidget {
  const NetworkErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AllTaskBloc, TaskState>(
      listener: (context, state) {
        if (state is AllTaskLoadedState) {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteName.main, (_) => false);
        }
        if (state is TaskNetworkErrorState) {
          AppSnackBar.show(context: context, message: "Network Error");
        }
      },
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const Spacer(flex: 2),
              const Text('Network Error'),
              const Spacer(flex: 1),
              ElevatedButton(
                onPressed: () {
                  context.read<AllTaskBloc>().add(TaskGetAllEvent());
                },
                child: const Text("Retry"),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
