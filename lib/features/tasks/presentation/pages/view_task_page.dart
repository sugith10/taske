import 'package:flutter/material.dart';
import 'package:taske/core/widget/default_app_bar.dart';
import 'package:taske/features/tasks/domain/entities/task_entity.dart';

/// Screen displaying details of a single task.
class ViewTaskPage extends StatelessWidget {
  const ViewTaskPage({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Title: \n',
                      style: TextStyle(
                        fontSize: size.width / 20,
                      ),
                    ),
                    TextSpan(
                      text: task.title,
                      style: TextStyle(
                        fontSize: size.width / 29,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.width / 20),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Description: \n',
                      style: TextStyle(
                        fontFamily: 'medium',
                        fontSize: size.width / 20,
                      ),
                    ),
                    TextSpan(
                      text: task.description,
                      style: TextStyle(
                        fontFamily: 'regular',
                        fontSize: size.width / 29,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
