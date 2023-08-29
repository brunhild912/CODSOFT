// ignore_for_file: prefer_const_constructors

import 'package:brainwave/pages/build_quiz_page.dart';
import 'package:flutter/material.dart';

import '../Models/question_model.dart';

class DartQuiz1 extends StatefulWidget {
  static const id = 'dart_quiz1';
  const DartQuiz1({super.key});

  @override
  State<DartQuiz1> createState() => _DartQuiz1State();
}

class _DartQuiz1State extends State<DartQuiz1> {
  @override
  Widget build(BuildContext context) {
    return BuildQuizPage(
      quizTitle: 'Dart Basics',
      countDownSeconds: 1200,
      questions: dartBasicsQuestions,
    );
  }
  List<Question> dartBasicsQuestions = [
    Question(
      id: '1',
      title: 'What is Dart?',
      options: {
        'A programming language': true,
        'A design pattern': false,
        'A framework': false,
        'A database': false,
      },
    ),
    Question(
      id: '2',
      title: 'Which company developed Dart?',
      options: {
        'Google': true,
        'Apple': false,
        'Microsoft': false,
        'Amazon': false,
      },
    ),
    Question(
      id: '3',
      title: 'Dart is primarily used for developing:',
      options: {
        'Mobile apps': false,
        'Web applications': false,
        'Both mobile and web apps': true,
        'Desktop software': false,
      },
    ),
    Question(
      id: '4',
      title: 'Dart is often used as the programming language for which framework?',
      options: {
        'React': false,
        'Angular': true,
        'Vue.js': false,
        'Flutter': false,
      },
    ),
    Question(
      id: '5',
      title: 'Dart uses a single-threaded event loop for concurrency.',
      options: {
        'True': true,
        'False': false,
      },
    ),
  ];
}
