import 'package:quiz_app/features/quiz/model/quiz_model.dart';

class AnswersController {
  List<int> correctAnswersList = [];
  List<bool> answers = [];

  compareAnswers() {
    answers.clear();

    for (int i = 0; i < correctAnswersList.length; i++) {
      bool x = quizList[i].correctAnswerIndex == correctAnswersList[i];
      answers.add(x);
    }
  }
}
