import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../task_user/presentation/bloc/bloc/task_users_bloc.dart';
import 'create_container.dart';

class SelectUserWidget extends StatelessWidget {

  final TextEditingController controller;

  const SelectUserWidget({

    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskUsersBloc, TaskUsersState>(
      builder: (context, state) {
        if (state is TaskUserLoaded) {
          return Column(
            children: [
              CreateContainer(
                title: "Select User",
                child: DropdownMenu<String>(
                  hintText: "Select User",
                  initialSelection:
                      controller.text.isNotEmpty ? controller.text : null,
                  label: Text(
                  "Select User",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  inputDecorationTheme: const InputDecorationTheme(
                    border: InputBorder.none,
                  ),
                  expandedInsets: const EdgeInsets.all(0),
                  width: double.infinity,
                  controller: controller,
                  onSelected: (value) {
                    if (value != null) {
                      controller.text = value;
                    }
                  },
                  dropdownMenuEntries: List.generate(
                    state.user.length,
                    (index) => DropdownMenuEntry(
                      value: "${state.user[index].firstName} ${state.user[index].lastName}",
                      label: "${state.user[index].firstName} ${state.user[index].lastName}",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
