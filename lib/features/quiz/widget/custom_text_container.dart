import 'package:flutter/material.dart';
import 'package:quiz_app/features/quiz/model/quiz_model.dart';

class CustomTextContainer extends StatelessWidget {
  const CustomTextContainer({
    super.key,
    required this.outPutTitleStream, required this.quizList,
  });

  final Stream<int> outPutTitleStream;
  final List<QuizModel> quizList;


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: outPutTitleStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final index = snapshot.data ?? 0;

        final question = quizList[index].question;

        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 24),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.black38, blurRadius: 30, spreadRadius: -1)
          ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Text(
            question,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, wordSpacing: -2),
          ),
        );
      },
    );
  }
}
