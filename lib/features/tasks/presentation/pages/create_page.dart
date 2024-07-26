import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taske/core/widget/snack_message.dart';

import '../../../../core/util/app_padding.dart';
import '../../../../core/widget/default_app_bar.dart';
import '../../domain/entities/task_entity.dart';
import '../bloc/inidividual_task_bloc/individual_task_bloc.dart';
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
  final TextEditingController remainingTimeController = TextEditingController();

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
    selectUserController.dispose();
    remainingTimeController.dispose();
    super.dispose();
  }

  void addToBloc() {
    context.read<IndividualTaskBloc>().add(TaskAddEvent(
          dateTime: dueDateController.text,
          description: descriptionController.text,
          priority: priorityController.text,
          title: titleController.text,
          status: statusController.text,
          task: widget.task,
          time: titleController.text,
          user: selectUserController.text,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<IndividualTaskBloc, IndividualTaskState>(
      listener: (context, state) {
        if (state is TaskSuccessState) {
          AppSnackBar.show(
              context: context, message: state.message, isError: false);
          Navigator.pop(context);
        }
        if (state is TaskErrorState) {
          AppSnackBar.show(context: context, message: state.message);
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
                  selectUserController: selectUserController,
                  titleController: titleController,
                  descriptionController: descriptionController,
                  dueDateController: dueDateController,
                  statusController: statusController,
                  priorityController: priorityController,
                  remainingTimeController: remainingTimeController,
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
