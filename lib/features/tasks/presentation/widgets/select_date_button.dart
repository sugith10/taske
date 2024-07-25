import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


import '../../../../core/theme/color/app_color.dart';

class SelectDateButton extends StatefulWidget {
  const SelectDateButton({
    super.key,
  });

  @override
  State<SelectDateButton> createState() => _SelectDateButtonState();
}

class _SelectDateButtonState extends State<SelectDateButton> {
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     
      child: SizedBox(
        child: Center(
            child: Text(
          DateFormat('d MMMM,y').format(DateTime.now()),
          style: const TextStyle(color: AppColor.bg),
        )),
      ),
    );
  }
}
