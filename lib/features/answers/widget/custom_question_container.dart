import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import 'custom_answer_container.dart';

class CustomQuestionContainer extends StatelessWidget {
  const CustomQuestionContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      height: 218,
      width: 300,
      decoration: BoxDecoration(
          color: AppColors.kGreen,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topRight: Radius.circular(20))),
      child: Center(
        child: Column(
          children: [
            Text(
              textAlign: TextAlign.center,
              "In what year did the United States host the FIFA World Cup for the first time?",
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
            CustomAnswerContainer()
          ],
        ),
      ),
    );
  }
}
