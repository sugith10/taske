import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taske/core/theme/color/app_color.dart';
import 'package:taske/features/tasks/presentation/bloc/inidividual_task_bloc/individual_task_bloc.dart';

/// Shows a confirmation dialog for deleting a post.
deleteDialogue({
  required BuildContext context,
  required int id,
}) {
  return showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: AppColor.create,
        content: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Are you sure you want to delete ?',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  context.read<IndividualTaskBloc>().add(DeleteTaskEvent(id));
                  Navigator.of(ctx).pop(); // Close the dialog
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(ctx)
                      .pop(); // Close the dialog without any action
                },
                child: const Text(
                  'No',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
        actionsPadding: const EdgeInsets.all(10),
      );
    },
  );
}
