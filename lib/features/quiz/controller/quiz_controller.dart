import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:quiz_app/features/quiz/model/quiz_model.dart';

import '../../answers/view/answers_screen.dart';

class QuizController {
  int answerIndex = -1;
  late StreamController<int> streamControllerQuiz;
  late Sink<int> inputDataQuiz;
  late Stream<int> outputDataQuiz;

  late StreamController<bool> streamNextController;
  late Sink<bool> inputDataNext;
  late Stream<bool> outputDataNext;
  bool isNextActive = false;

  int quizCount = quizList.length;

  List<QuizModel> get allQuestions => quizList;

  int timeCounterNow = 0;
  late StreamController<int> timeController;
  late Sink<int> inputDataTime;
  late Stream<int> outputDataTime;

  late StreamController<int> questionTitleController;
  late Sink<int> inputDataTitle;
  late Stream<int> outputDataTitle;

  late StreamController<double> animationDataController;
  late Sink<double> inputDataAnimation;
  late Stream<double> outputDataAnimation;

  late StreamController<String> questionIndexController;
  late Sink<String> inputDataQuestionIndex;
  late Stream<String> outputDataQuestionIndex;

  int questionNow = 0;

  List<int> correctAnswersList = [];

  late AnimationController animationController;
  double animationProgress = 0;
  Tween<double> tween = Tween(begin: 0.0, end: 1.0);

  late BuildContext context;

  QuizController(TickerProvider vsync, this.context) {
    animationController =
        AnimationController(vsync: vsync, duration: Duration(seconds: 30));

    streamControllerQuiz = StreamController();
    inputDataQuiz = streamControllerQuiz.sink;
    outputDataQuiz = streamControllerQuiz.stream.asBroadcastStream();
    inputDataQuiz.add(answerIndex);

    streamNextController = StreamController();
    inputDataNext = streamNextController.sink;
    outputDataNext = streamNextController.stream.asBroadcastStream();
    inputDataNext.add(isNextActive);

    timeController = StreamController();
    inputDataTime = timeController.sink;
    outputDataTime = timeController.stream.asBroadcastStream();
    inputDataTime.add(timeCounterNow);

    questionTitleController = StreamController();
    inputDataTitle = questionTitleController.sink;
    outputDataTitle = questionTitleController.stream.asBroadcastStream();
    inputDataTitle.add(questionNow);

    animationDataController = StreamController();
    inputDataAnimation = animationDataController.sink;
    outputDataAnimation = animationDataController.stream.asBroadcastStream();
    inputDataAnimation.add(animationProgress);

    questionIndexController = StreamController();
    inputDataQuestionIndex = questionIndexController.sink;
    outputDataQuestionIndex =
        questionIndexController.stream.asBroadcastStream();
    inputDataQuestionIndex.add('${questionNow + 1}/$quizCount');

  }

  forwardAnimation() {
    animationController.reset();
    animationController.forward();
    animationController.addListener(() {
      animationProgress = tween.evaluate(animationController);
      inputDataAnimation.add(animationProgress);
      inputDataTime.add((animationProgress * 30).toInt() + 1);
    });
  }

  restartAnimation() {
    animationController.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          nextQuestion();
        }
      },
    );
  }

  timeCounter() {
    forwardAnimation();
    inputDataTime.add((animationProgress * 30).toInt());
  }

  nextQuestion() {
    if (questionNow == correctAnswersList.length) {
      correctAnswersList.add(answerIndex);
    } else {
      correctAnswersList[questionNow] = answerIndex;
    }
    answerIndex = -1;
    inputDataQuiz.add(answerIndex);
    if (questionNow >= quizList.length - 1) {
      inputDataAnimation.add(animationProgress);
      Navigator.pushReplacement(
          context,
          CupertinoModalPopupRoute(
            builder: (context) => AnswersScreen(),
          ));
    } else {
      questionNow++;
      timeCounter();
    }
    inputDataTitle.add(questionNow);
    inputDataQuestionIndex.add('${questionNow + 1}/$quizCount');
  }

  onTap(int index) {
    answerIndex = index;
    if (questionNow == correctAnswersList.length) {
      correctAnswersList.add(answerIndex);
    } else {
      correctAnswersList[questionNow] = answerIndex;
    }
    for (int i in correctAnswersList) {
      if (kDebugMode) {
        print(i);
      }
    }
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
    inputDataNext.close();
    streamNextController.close();
    inputDataTime.close();
    timeController.close();
    inputDataAnimation.close();
    animationDataController.close();
    questionTitleController.close();
    inputDataTitle.close();
    questionIndexController.close();
    inputDataQuestionIndex.close();
  }
}
