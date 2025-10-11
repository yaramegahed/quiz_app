import 'package:flutter/material.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';

import '../controller/quiz_controller.dart';
import '../model/quiz_model.dart';
import 'custom_radio_container.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.quizController,
    required this.currentQuestion,
    required this.outputDataGroupValueRadio,
    required this.outPutStreamQuestion,
  });

  final Stream<int> outputDataGroupValueRadio;
  final Stream<int> outPutStreamQuestion;

  final QuizController quizController;
  final QuizModel currentQuestion;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return StreamBuilder2(
            streams:
                StreamTuple2(outPutStreamQuestion, outputDataGroupValueRadio),
            builder: (BuildContext context, snapshots) {

              return CustomRadioContainer(
                answer: quizController
                    .allQuestions[snapshots.snapshot1.data == null
                        ? 0
                        : snapshots.snapshot1.data!]
                    .answers[index],
                isSelected: snapshots.snapshot2.data == null
                    ? false
                    : snapshots.snapshot2.data == index
                        ? true
                        : false,
                onTap: () {
                  quizController.onTap(index);
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
        itemCount: currentQuestion.answers.length,
      ),
    );
  }
}
