import 'package:flutter/material.dart';
import 'package:quiz_app/core/colors/colors.dart';
import 'package:quiz_app/core/widget/custom_button.dart';
import 'package:quiz_app/features/quiz/controller/quiz_controller.dart';
import 'package:quiz_app/features/quiz/model/quiz_model.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_circle_indicator.dart';
import '../widget/custom_list_view.dart';
import '../widget/custom_text_container.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.name});
  final String name;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with SingleTickerProviderStateMixin {
  late QuizController quizController;

  @override
  void initState() {
    quizController = QuizController(this, context,widget.name);
    quizController.timeCounter();
    quizController.forwardAnimation();
    quizController.restartAnimation();
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
    final currentQuestion = quizController.allQuestions[0];
    return Scaffold(
      backgroundColor: AppColors.kQuizBGColor,
      appBar: CustomAppBar(
        title: quizController.outputDataQuestionIndex,
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
                CustomTextContainer(
                  outPutTitleStream: quizController.outputDataTitle,
                  quizList: quizList,
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  top: -50,
                  child: CustomCircleIndicator(
                    outPutTime: quizController.outputDataTime,
                    outPutAnimationProgress: quizController.outputDataAnimation,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            CustomListView(
              quizController: quizController,
              currentQuestion: currentQuestion,
              outputDataGroupValueRadio: quizController.outputDataQuiz,
              outPutStreamQuestion: quizController.outputDataTitle,
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              onTap: () {
                quizController.nextQuestion();
              },
              title: 'Next',
              isActive: quizController.outputDataNext,
            )
          ],
        ),
      ),
    );
  }
}
