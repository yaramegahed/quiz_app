import 'package:flutter/material.dart';

import '../colors/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.kPrimary),
        child: Center(
          child: Text(
            "Start",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
