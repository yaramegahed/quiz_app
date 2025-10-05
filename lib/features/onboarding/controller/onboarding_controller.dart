import 'dart:async';

class OnboardingController {
  double currentPositionPage = 0;
  late StreamController streamController;
  late Sink inputData;
  late Stream outputData;

  OnboardingController() {
    streamController = StreamController();
    inputData = streamController.sink;
    outputData = streamController.stream;
    inputData.add(currentPositionPage);
  }

  onTap(int indexPosition) {
    currentPositionPage = indexPosition.toDouble();
    inputData.add(currentPositionPage);
  }

  nextOnTap() {
    if (currentPositionPage == 2) {
      currentPositionPage = 0;
    } else {
      currentPositionPage++;
    }
    inputData.add(currentPositionPage);
  }
  onDispose(){
    inputData.close();
    streamController.close();
  }
}
