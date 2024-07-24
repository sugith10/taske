import 'package:flutter/material.dart';
import 'package:taske/core/util/app_padding.dart';

import '../../../../core/widget/default_app_bar.dart';
import '../widgets/create_container.dart';
import '../widgets/create_textfield.dart';
import '../widgets/priority_widget.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priorityController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            const DefaultAppBar(),
            Padding(
              padding: const EdgeInsets.all(AppPadding.home),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      CreateContainer(
                        title: "Title",
                        child: CreateTextField(
                          titleController: _titleController,
                          hintText: "Title",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  CreateContainer(
                    title: "Description",
                    child: CreateTextField(
                      titleController: _descriptionController,
                      hintText: "Description",
                    ),
                  ),
                  const SizedBox(height: 30),
                  CreateContainer(
                    title: "Due Date",
                    child: CreateTextField(
                      titleController: _descriptionController,
                      hintText: "Description",
                    ),
                  ),
                  const SizedBox(height: 30),
                  CreateContainer(
                    title: "Priority",
                    child: ExperienceWidget(
                      controller: _priorityController,
                      hintText: "Priority",
                    ),
                  ),
                  const SizedBox(height: 30),
                  CreateContainer(
                    title: "Status",
                    child: CreateTextField(
                      titleController: _descriptionController,
                      hintText: "Description",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
