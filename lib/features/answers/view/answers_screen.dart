import 'package:flutter/material.dart';
import 'package:quiz_app/features/answers/widget/custom_info_container.dart';
import 'package:quiz_app/features/quiz/model/quiz_model.dart';

import '../../../core/colors/colors.dart';
import '../controller/answers_controller.dart';
import '../widget/custom_count_container.dart';
import '../widget/custom_question_container.dart';

class AnswersScreen extends StatefulWidget {
  final String name;
  final List<int> listCorrectAnswer;

  const AnswersScreen(
      {super.key, required this.name, required this.listCorrectAnswer});

  @override
  State<AnswersScreen> createState() => _AnswersScreenState();
}

class _AnswersScreenState extends State<AnswersScreen> {
  late AnswersController answersController;

  @override
  void initState() {
    // TODO: implement initState
    answersController = AnswersController();
    answersController.correctAnswersList = widget.listCorrectAnswer;
    answersController.compareAnswers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kPrimary,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 39,
              ),
              CustomInfoContainer(
                name: widget.name,
                grade:
                    "${answersController.answers.where((e) => e).length} / ${quizList.length}",
              ),
              SizedBox(
                height: 23,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomCountContainer(
                          order: index + 1,
                          isCorrect: answersController.answers[index],
                        ),
                        CustomQuestionContainer(
                          question: quizList[index].question,
                          answer:
                              answersController.correctAnswersList[index] == -1
                                  ? "Not answered"
                                  : quizList[index].answers[index],
                          isCorrect: answersController.answers[index],
                          correctAnswer: quizList[index]
                              .answers[quizList[index].correctAnswerIndex],
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: answersController.answers.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
