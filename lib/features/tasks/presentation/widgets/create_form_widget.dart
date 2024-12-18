import 'package:flutter/material.dart';

import 'create_container.dart';
import 'create_textfield.dart';
import 'due_date_widget.dart';
import 'priority_widget.dart';
import 'select_user_widget.dart';

class CreateFormWidget extends StatelessWidget {
  const CreateFormWidget({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.dueDateController,
    required this.statusController,
    required this.priorityController,
    required this.remainingTimeController,
    required this.selectUserController,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController dueDateController;
  final TextEditingController statusController;
  final TextEditingController priorityController;
  final TextEditingController remainingTimeController;
  final TextEditingController selectUserController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        CreateContainer(
          title: "Title",
          child: CreateTextField(
            titleController: titleController,
            hintText: "Title",
          ),
        ),
        const SizedBox(height: 30),
        CreateContainer(
          title: "Description",
          child: CreateTextField(
            titleController: descriptionController,
            hintText: "Description",
          ),
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            Expanded(
                child: DueDateWidget(
              dueDateController: dueDateController,
              title: "Due Date",
              date: true,
            )),
            const SizedBox(width: 10),
            Expanded(
                child: DueDateWidget(
              dueDateController: remainingTimeController,
              title: "Remaining Time",
              date: false,
            )),
          ],
        ),
        const SizedBox(height: 30),
       
       SelectUserWidget(controller: selectUserController,),
        CreateContainer(
          title: "Status",
          child: ExperienceWidget(
            controller: statusController,
            hintText: "Status",
            optionOne: "To-Do",
            optionTwo: "In Progress",
            optionThree: "Done",
          ),
        ),
        const SizedBox(height: 30),
        CreateContainer(
          title: "Priority",
          child: ExperienceWidget(
            controller: priorityController,
            hintText: "Priority",
            optionOne: "High",
            optionTwo: "Medium",
            optionThree: "Low",
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
