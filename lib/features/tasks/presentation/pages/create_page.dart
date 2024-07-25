import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/app_padding.dart';
import '../../../../core/widget/default_app_bar.dart';
import '../../domain/entities/task_entity.dart';
import '../bloc/task_bloc/task_bloc.dart';
import '../widgets/create_floating_action_button.dart';
import '../widgets/create_form_widget.dart';

class CreatePage extends StatefulWidget {
  final Task? task;
  const CreatePage({this.task, super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priorityController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
   final TextEditingController selectUserController = TextEditingController();

  @override
  void initState() {
    if (widget.task != null) {
      titleController.text = widget.task!.title;
      descriptionController.text = widget.task!.description;
    }
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    priorityController.dispose();
    dueDateController.dispose();
    statusController.dispose();
    super.dispose();
  }

  void addToBloc() {
    context.read<TaskBloc>().add(TaskAddEvent(
          dateTime: dueDateController.text,
          description: descriptionController.text,
          priority: priorityController.text,
          title: titleController.text,
          status: statusController.text,
          task: widget.task,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskBloc, TaskState>(
      listener: (context, state) {
        if (state is TaskSuccessState) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const DefaultAppBar(),
              Padding(
                padding: const EdgeInsets.all(AppPadding.home),
                child: CreateFormWidget(
                  titleController: titleController,
                  descriptionController: descriptionController,
                  dueDateController: dueDateController,
                  statusController: statusController,
                  priorityController: priorityController,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: CreateFloatingActionButton(
          task: widget.task,
          onPressed: addToBloc,
        ),
      ),
    );
  }
}
