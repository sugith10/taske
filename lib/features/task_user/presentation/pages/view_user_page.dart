import 'package:flutter/material.dart';
import 'package:taske/core/widget/default_app_bar.dart';
import 'package:taske/features/task_user/domain/entities/task_user.dart';

class ViewUserPage extends StatelessWidget {
  final TaskUser taskUser;
  const ViewUserPage({required this.taskUser, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const Spacer(flex: 1),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(taskUser.avatar)),
            const SizedBox(height: 20),
            Text(
              "${taskUser.firstName} ${taskUser.lastName}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(taskUser.email, style: const TextStyle(fontSize: 20)),
               const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
