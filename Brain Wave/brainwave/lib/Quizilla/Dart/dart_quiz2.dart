// ignore_for_file: prefer_const_constructors

import 'package:brainwave/pages/build_quiz_page.dart';
import 'package:flutter/material.dart';

import '../Models/question_model.dart';

class DartQuiz2 extends StatefulWidget {
  static const id = 'dart_quiz2';
  const DartQuiz2({super.key});

  @override
  State<DartQuiz2> createState() => _DartQuiz2State();
}

class _DartQuiz2State extends State<DartQuiz2> {
  @override
  Widget build(BuildContext context) {
    return BuildQuizPage(
      quizTitle: 'Dart: Asnc Programming',
      countDownSeconds: 900,
      questions: asyncProgrammingQuestions,
    );
  }

  List<Question> asyncProgrammingQuestions = [
    Question(
      id: '1',
      title: 'What is asynchronous programming in Dart?',
      options: {
        'A way to write code sequentially': false,
        'A way to perform multiple tasks concurrently': true,
        'A way to avoid writing code': false,
        'A way to make code run slower': false,
      },
    ),
    Question(
      id: '2',
      title: 'Which keyword is used to mark a function as asynchronous in Dart?',
      options: {
        'async': true,
        'await': false,
        'future': false,
        'sync': false,
      },
    ),
    Question(
      id: '3',
      title: 'What does the `await` keyword do?',
      options: {
        'Pause the program and wait for a Future to complete': true,
        'Skip the next line of code': false,
        'Terminate the program': false,
        'Print a message to the console': false,
      },
    ),
    Question(
      id: '4',
      title: 'What is a Future in Dart?',
      options: {
        'A representation of a value that might be available in the future': true,
        'A keyword used for loops': false,
        'A type of data structure': false,
        'A keyword used for branching': false,
      },
    ),
    Question(
      id: '5',
      title: 'What is the purpose of the `async` function modifier?',
      options: {
        'To mark a function as asynchronous and allow using the `await` keyword': true,
        'To make a function run synchronously': false,
        'To prevent a function from executing': false,
        'To execute a function in a separate thread': false,
      },
    ),
  ];
}