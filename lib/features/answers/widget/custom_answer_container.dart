import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class CustomAnswerContainer extends StatelessWidget {
  const CustomAnswerContainer({
    super.key,  required this.isCorrect, required this.answer,
  });
  final bool isCorrect;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      height: 45,
      width: 278,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white),
      child: Row(
        children: [
          isCorrect == true
              ? Icon(Icons.check_circle,
              color: AppColors.kPrimary, size: 26)
              : Icon(Icons.cancel,color: AppColors.kPrimary, size: 26),
          Expanded(
            child: Text(
              maxLines: 2,
              textAlign: TextAlign.center,
              answer,
              style: TextStyle(
                height: 1.2,
                  color: AppColors.kPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}

