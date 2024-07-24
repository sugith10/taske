import 'package:flutter/material.dart';

class CreateTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController titleController;

  const CreateTextField({
    required this.hintText,
    required this.titleController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: titleController,
      maxLines: null,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
      ),
    );
  }
}
