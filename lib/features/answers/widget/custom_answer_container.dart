import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/widget/custom_check_container.dart';

class CustomAnswerContainer extends StatelessWidget {
  const CustomAnswerContainer({
    super.key,  this.isSelected,
  });
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      height: 41,
      width: 278,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white),
      child: Row(
        children: [
          isSelected == true
              ? Icon(Icons.check_circle,
              color: AppColors.kPrimary, size: 26)
              : CustomCheckContainer(),
          SizedBox(width: 85,),
          Text(
            textAlign: TextAlign.center,
            "1888",
            style: TextStyle(
                color: AppColors.kPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          )
        ],
      ),
    );
  }
}

