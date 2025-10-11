import 'package:flutter/material.dart';
import 'package:quiz_app/features/answers/widget/custom_info_container.dart';

import '../../../core/colors/colors.dart';
import '../widget/custom_count_container.dart';
import '../widget/custom_question_container.dart';

class AnswersScreen extends StatelessWidget {
  const AnswersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 39,
              ),
              CustomInfoContainer(),
              SizedBox(
                height: 23,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCountContainer(),
                  CustomQuestionContainer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



