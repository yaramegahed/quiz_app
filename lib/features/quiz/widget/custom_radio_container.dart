import 'package:flutter/material.dart';
import 'package:quiz_app/features/quiz/widget/custom_check_container.dart';

import '../../../core/colors/colors.dart';

class CustomRadioContainer extends StatelessWidget {
  const CustomRadioContainer({
    super.key,
    required this.answer,
    required this.onTap,
    required this.isSelected,
  });

  final String answer;
  final void Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        height: 53,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isSelected == true ? AppColors.kCircleBG : Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              answer,
              style: TextStyle(
                  color: AppColors.kPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            isSelected == true
                ? Icon(Icons.check_circle,
                    color: AppColors.kPrimary, size: 26)
                : CustomCheckContainer()
          ],
        ),
      ),
    );
  }
}
