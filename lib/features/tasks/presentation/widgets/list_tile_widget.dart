import 'package:flutter/material.dart';
import 'package:taske/core/route/route_name/route_name.dart';
import 'package:taske/core/theme/color/app_color.dart';
import 'package:taske/features/tasks/domain/entities/task_entity.dart';

import 'delete_dialogue.dart';

class ListTileWidget extends StatelessWidget {
  final Task task;
  const ListTileWidget({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        trailing: PopupMenuButton<String>(
          color: AppColor.create,
          onSelected: (value) {
            if (value == 'edit') {
              Navigator.pushNamed(context, RouteName.create, arguments: task);
            } else if (value == 'delete') {
              deleteDialogue(
                context: context,
                id: task.id,
              );
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem<String>(
                value: 'edit',
                child: Text(
                  'Edit',
                  style: TextStyle(fontFamily: 'medium', color: AppColor.bg),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'delete',
                child: Text(
                  'Delete',
                  style: TextStyle(color: AppColor.bg),
                ),
              ),
            ];
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Title:\n',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextSpan(
                    text: task.title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color.fromARGB(255, 77, 77, 77),
                        ),
                  ),
                ],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Description:\n',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextSpan(
                    text: task.description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color.fromARGB(255, 77, 77, 77),
                        ),
                  ),
                ],
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            RouteName.viewTask,
            arguments: task,
          );
        },
      ),
    );
  }
}
