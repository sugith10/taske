import 'package:flutter/material.dart';

import '../../../../core/theme/color/app_color.dart';
import '../../domain/entities/task_entity.dart';

class CreateFloatingActionButton extends StatelessWidget {
  final Task? task;
  final VoidCallback onPressed;
  const CreateFloatingActionButton({
    super.key,
    required this.task,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      backgroundColor: AppColor.create,
      shape: const StadiumBorder(),
      label: Text(
        task != null ? "Update Task" : "Create Task",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
