import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'create_container.dart';

class DueDateWidget extends StatefulWidget {
  final TextEditingController dueDateController;
  final String title;
  final bool date;
  const DueDateWidget({
    super.key,
    required this.title,
    required this.dueDateController,
    required this.date,
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

    void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((selectedTime) {
      if (selectedTime != null) {
        final now = DateTime.now();
        final selectedDateTime = DateTime(now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);
        final remainingTime = selectedDateTime.difference(now);

        if (remainingTime.isNegative) {
          // If the selected time is before the current time, add 24 hours to it
          final tomorrowSelectedDateTime = selectedDateTime.add(const Duration(days: 1));
          final remainingTimeTomorrow = tomorrowSelectedDateTime.difference(now);
          widget.dueDateController.text = _formatDuration(remainingTimeTomorrow);
        } else {
          widget.dueDateController.text = _formatDuration(remainingTime);
        }
      }
    });
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    return '$hours hours and $minutes minutes remaining';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.date ? _showDatePicker : _showTimePicker,
      child:  CreateContainer(
        title: widget.title,
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
