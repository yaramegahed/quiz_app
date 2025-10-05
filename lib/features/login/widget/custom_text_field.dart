import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
        ));
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.kPrimary,width: 1.5),
            borderRadius: BorderRadius.circular(20));
  }
}
