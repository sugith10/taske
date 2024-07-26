import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:taske/core/route/route_name/route_name.dart';

import '../../domain/entities/task_user.dart';

class TaskUserTileWidget extends StatelessWidget {
  final TaskUser taskUser;
  const TaskUserTileWidget({
    required this.taskUser,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(
          context,
          RouteName.viewUser,
          arguments: taskUser,
        );
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 30),
      title: Text("${taskUser.firstName} ${taskUser.lastName}"),
      subtitle: Text(taskUser.email),
      trailing: const Icon(IconlyLight.arrow_right_2),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(taskUser.avatar),
      ),
    );
  }
}
