import 'package:flutter/material.dart';

class ExperienceWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String optionOne;
  final String optionTwo;
  final String optionThree;

  const ExperienceWidget({
    required this.hintText,
    required this.controller,
    required this.optionOne,
    required this.optionTwo,
    required this.optionThree,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      hintText: hintText,
      initialSelection: controller.text.isNotEmpty ? controller.text : null,
      label: Text(
        hintText,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
      expandedInsets: const EdgeInsets.all(0),
      width: double.infinity,
      controller: controller,
      onSelected: (value) {
        if (value != null) {
          controller.text = value;
        }
      },
      dropdownMenuEntries: [
        DropdownMenuEntry(value: optionOne, label: optionOne),
        DropdownMenuEntry(value: optionTwo, label: optionTwo),
        DropdownMenuEntry(value: optionThree, label: optionThree)
      ],
    );
  }
}
