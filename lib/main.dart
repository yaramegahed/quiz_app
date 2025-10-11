import 'package:flutter/material.dart';
import 'package:quiz_app/features/answers/view/answers_screen.dart';
import 'package:quiz_app/features/quiz/view/quiz_screen.dart';
import 'package:quiz_app/features/splash/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Montserrat"),
      debugShowCheckedModeBanner: false,
      home: const AnswersScreen(),
    );
  }
}


