import 'dart:async';

import 'package:flutter/material.dart';

class LoginScreenController {
  bool buttonIsActive= false;
  late StreamController<bool> streamController;
  late Sink<bool> inputData;
  late Stream<bool> isActive;
  final GlobalKey<FormState> formKey=GlobalKey();
  late TextEditingController textEditingController;


  LoginScreenController() {
    streamController = StreamController();
    inputData = streamController.sink;
    isActive = streamController.stream;
    inputData.add(buttonIsActive);
    textEditingController=TextEditingController();
  }

  void onChangedTextFormField() {

    if (formKey.currentState!.validate()) {
      buttonIsActive = true;
    } else {
      buttonIsActive = false;
    }
    inputData.add(buttonIsActive);
  }
  onDispose(){
    inputData.close();
    streamController.close();
  }

}
