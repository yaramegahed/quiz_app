import 'package:flutter/material.dart';
import 'package:quiz_app/core/colors/colors.dart';
import 'package:quiz_app/core/widget/custom_button.dart';
import 'package:quiz_app/features/quiz/controller/quiz_controller.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_circle_indicator.dart';
import '../widget/custom_radio_container.dart';
import '../widget/custom_text_container.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late QuizController quizController;

  @override
  void initState() {
    quizController = QuizController();
    super.initState();
  }

  @override
  void dispose() {
    quizController.onDispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kQuizBGColor,
      appBar: CustomAppBar(
        title: '1/${quizController.quizCount}',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                CustomTextContainer(),
                Positioned(
                  right: 0,
                  left: 0,
                  top: -50,
                  child: CustomCircleIndicator(),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            // for(int i = 0; i < quizController.answers.length; i++)
            Expanded(
              child: ListView.separated(
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return StreamBuilder(
                    stream: quizController.outputDataQuiz,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return CustomRadioContainer(
                        answer: quizController.answers[index],
                        isSelected: snapshot.data == null
                            ? false
                            : snapshot.data == index
                                ? true
                                : false,
                        onTap: () {
                          quizController.onTap(index);
                          print(index);
                        },
                      );
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 25,
                  );
                },
                itemCount: quizController.answers.length,
              ),
            ),

            SizedBox(
              height: 20,
            ),
            CustomButton(
              onTap: () {},
              title: 'Next',
              isActive: quizController.outputDataNext,
            )
          ],
        ),
      ),
    );
  }
}
