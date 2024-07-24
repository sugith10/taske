import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taske/features/home/presentation/widgets/create_button.dart';

import '../../../../core/theme/color/app_color.dart';

class SelectDateButton extends StatefulWidget {
  const SelectDateButton({
    super.key,
  });

  @override
  State<SelectDateButton> createState() => _SelectDateButtonState();
}

class _SelectDateButtonState extends State<SelectDateButton> {
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
    ).then((value){
      if(value != null){
        print(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showDatePicker,
      child: CreateButton(
        child: Center(
            child: Text(
          DateFormat('d MMMM,y').format(DateTime.now()),
          style: const TextStyle(color: AppColor.bg),
        )),
      ),
    );
  }
}
