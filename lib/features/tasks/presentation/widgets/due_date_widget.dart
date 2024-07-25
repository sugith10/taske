import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'create_container.dart';

class DueDateWidget extends StatefulWidget {
  final TextEditingController dueDateController;

  const DueDateWidget({
    super.key,
    required this.dueDateController,
  });

  @override
  State<DueDateWidget> createState() => _DueDateWidgetState();
}

class _DueDateWidgetState extends State<DueDateWidget> {
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
    ).then((value) {
      if (value != null) {
        widget.dueDateController.text = DateFormat('d MMMM,y').format(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _showDatePicker,
      child:  CreateContainer(
        title: "Due Date",
        child:TextField(
          enabled: false,
          controller: widget.dueDateController,
          style: Theme.of(context).textTheme.labelLarge,
          decoration:const InputDecoration(
            border: InputBorder.none,
            hintText: "Select Due Date",
     
          ),
        ),
      ),
    );
  }
}
