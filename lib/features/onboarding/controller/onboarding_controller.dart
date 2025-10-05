import 'dart:async';

import 'package:flutter/material.dart';

class OnboardingController {
  int currentPositionPage = 0;
  late StreamController streamController;
  late PageController pageController;
  late Sink inputData;
  late Stream outputData;
  bool isTapped =false;

  OnboardingController() {
    streamController = StreamController();
    inputData = streamController.sink;
    outputData = streamController.stream;
    inputData.add(currentPositionPage);
    pageController = PageController(initialPage: currentPositionPage);
  }

  onTap(int indexPosition) {
    currentPositionPage = indexPosition;
    pageController.animateToPage(currentPositionPage,
        duration: Duration(milliseconds: 400), curve: Curves.ease);

    inputData.add(currentPositionPage);
  }

  nextOnTap() {
      // if (currentPositionPage == 2) {
      //   currentPositionPage = 0;
      // } else {
        // currentPositionPage++;
    // }
    pageController.animateToPage(currentPositionPage.toInt(),
        duration: Duration(milliseconds: 400), curve: Curves.ease);
    inputData.add(currentPositionPage);
    currentPositionPage++;
    currentPositionPage%=3;
  }

  onDispose() {
    inputData.close();
    streamController.close();
    pageController.dispose();
  }
}
