import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.onChanged, this.controller,
  });

  final void Function(String?)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
        onChanged: onChanged,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "Field is required";
          } else if (value!.length < 3) {
            return "Please enter valid name";
          }
          return null;
        },
        decoration: InputDecoration(
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            border: buildOutlineInputBorder()));
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.kPrimary, width: 1.5),
        borderRadius: BorderRadius.circular(20));
  }
}
