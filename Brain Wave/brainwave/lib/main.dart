// ignore_for_file: prefer_const_constructors

import 'package:brainwave/Quizilla/Dart/dart_quiz1.dart';
import 'package:brainwave/Quizilla/Kotlin/kotlin_quiz1.dart';
import 'package:brainwave/pages/build_quiz_page.dart';
import 'package:brainwave/pages/build_result_page.dart';
import 'package:brainwave/Quizilla/Python/python_quiz1.dart';
import 'package:brainwave/Quizilla/polyglot_quiz.dart';
import 'package:brainwave/pages/home_page.dart';
import 'package:brainwave/pages/dart_page.dart';
import 'package:brainwave/pages/java_page.dart';
import 'package:brainwave/pages/kotlin_page.dart';
import 'package:brainwave/pages/python_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Quizilla/Dart/dart_quiz2.dart';
import 'Quizilla/Java/java_quiz1.dart';
import 'Quizilla/Java/java_quiz2.dart';
import 'Quizilla/Kotlin/kotlin_quiz2.dart';
import 'Quizilla/Python/python_quiz2.dart';
import 'components/constants.dart';

void main() {
  runApp(const BrainWave());
}

class BrainWave extends StatelessWidget {
  const BrainWave({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        textSelectionTheme: TextSelectionThemeData(
        selectionColor: kAccentColor,
        selectionHandleColor: kAccentColor,
        cursorColor: kAccentColor,
    ),
      ),
      home: HomePage(),
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        DartPage.id: (context) => DartPage(),
        PythonPage.id: (context) => PythonPage(),
        JavaPage.id: (context) => JavaPage(),
        KotlinPage.id: (context) => KotlinPage(),
        BuildQuizPage.id: (context) => BuildQuizPage(),
        ResultPage.id: (context) => ResultPage(),
        DartQuiz1.id: (context) => DartQuiz1(),
        DartQuiz2.id: (context) => DartQuiz2(),
        KotlinQuiz1.id: (context) => KotlinQuiz1(),
        KotlinQuiz2.id: (context) => KotlinQuiz2(),
        JavaQuiz1.id: (context) => KotlinQuiz1(),
        JavaQuiz2.id: (context) => JavaQuiz2(),
        PythonQuiz1.id: (context) => PythonQuiz1(),
        PythonQuiz2.id: (context) => PythonQuiz2(),
        PolyglotQuiz.id: (context) => PolyglotQuiz(),
      },
    );
  }
}
