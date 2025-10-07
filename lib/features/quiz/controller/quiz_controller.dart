import 'dart:async';

import 'package:quiz_app/features/quiz/model/quiz_model.dart';

class QuizController {
  List<String> answers = [
    "2010",
    "1898",
    "2002",
    "1990",
  ];
  int answerIndex = -1;
  late StreamController<int> streamControllerQuiz;
  late Sink<int> inputDataQuiz;
  late Stream<int> outputDataQuiz;

  late StreamController<bool> streamController;
  late Sink<bool> inputDataNext;
  late Stream<bool> outputDataNext;
  bool isNextActive = false;

  int quizCount=0;
  List<QuizModel> get allQuestions => quizList;


  QuizController() {
    streamControllerQuiz = StreamController();
    inputDataQuiz = streamControllerQuiz.sink;
    outputDataQuiz = streamControllerQuiz.stream.asBroadcastStream();
    inputDataQuiz.add(answerIndex);

    streamController = StreamController();
    inputDataNext = streamController.sink;
    outputDataNext = streamController.stream.asBroadcastStream();
    inputDataNext.add(isNextActive);

    quizCount=quizList.length;
  }

  onTap(int index) {
    answerIndex = index;
    inputDataQuiz.add(index);
    if (answerIndex != -1) {
      isNextActive = true;
    } else {
      isNextActive = false;
    }
    inputDataNext.add(isNextActive);
  }

  onDispose() {
    inputDataQuiz.close();
    streamControllerQuiz.close();
  }
}
