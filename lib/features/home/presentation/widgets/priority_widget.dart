import 'package:flutter/material.dart';

class ExperienceWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const ExperienceWidget({
    required this.hintText,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? chosenModel = "Beginner";
    controller.text = chosenModel;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownMenu(
          hintText: hintText,
          initialSelection: chosenModel,
          label: Text(
            "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          inputDecorationTheme: const InputDecorationTheme(),
          expandedInsets: const EdgeInsets.all(0),
          width: double.infinity,
          controller: SearchController(),
          onSelected: (value) {
            chosenModel = value;
            controller.text = value!;
          },
          dropdownMenuEntries: [
            DropdownMenuEntry(value: chosenModel, label: "Beginner"),
            DropdownMenuEntry(value: chosenModel, label: "Intermediate"),
            DropdownMenuEntry(value: chosenModel, label: "Experienced")
          ],
        ),
      ],
    );
  }
}
