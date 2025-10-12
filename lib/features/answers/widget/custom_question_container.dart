import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import 'custom_answer_container.dart';

class CustomQuestionContainer extends StatelessWidget {
  const CustomQuestionContainer({
    super.key,
    required this.question,
    required this.answer,
    required this.isCorrect,
    required this.correctAnswer,
  });

  final bool isCorrect;
  final String question;
  final String answer;
  final String correctAnswer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      width: 300,
      decoration: BoxDecoration(
          color: isCorrect == true ? AppColors.kGreen : AppColors.kRed,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topRight: Radius.circular(20))),
      child: Center(
        child: Column(
          children: [
            Text(
              textAlign: TextAlign.center,
              question,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 8,
            ),
            Divider(
              color: AppColors.kDividerWhite,
            ),
            SizedBox(
              height: 8,
            ),
            if (isCorrect == false)
              CustomAnswerContainer(
                answer: answer,
                isCorrect: false,
              ),
            SizedBox(
              height: 10,
            ),
            CustomAnswerContainer(
              answer: correctAnswer,
              isCorrect: true,
            ),
            SizedBox(
              height: 13,
            )
          ],
        ),
      ),
    );
  }
}
