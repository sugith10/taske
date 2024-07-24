import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:taske/features/home/presentation/widgets/create_button.dart';

import '../../../../core/theme/color/app_color.dart';

class StatusDropdown extends StatefulWidget {
  const StatusDropdown({super.key});

  @override
  createState() => _StatusDropdownState();
}

class _StatusDropdownState extends State<StatusDropdown> {
  String dropdownValue = 'To-Do'; // Default value

  @override
  Widget build(BuildContext context) {
    return CreateButton(
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(IconlyLight.arrow_down_2, color: Colors.white),
          elevation: 16,
          dropdownColor: AppColor.create,
          style: const TextStyle(color: Colors.white),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          borderRadius: BorderRadius.circular(20),
          items: <String>['To-Do', 'In Progress', 'Done']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
