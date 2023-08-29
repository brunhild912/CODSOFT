import 'package:brainwave/pages/build_quiz_page.dart';
import 'package:brainwave/components/constants.dart';
import 'package:flutter/material.dart';

import 'Models/question_model.dart';

class PolyglotQuiz extends StatefulWidget {
  static const id = 'polyglot_quiz';
  const PolyglotQuiz({super.key});

  @override
  State<PolyglotQuiz> createState() => _PolyglotQuizState();
}

class _PolyglotQuizState extends State<PolyglotQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: BuildQuizPage(
        quizTitle: 'Polyglot quiz',
        countDownSeconds: 1200,
        questions: polyglotQuizQuestions,
      ),
    );
  }
  List<Question> polyglotQuizQuestions = [
    Question(
      id: '1',
      title: 'What is the purpose of a Java interface?',
      options: {
        'To define a concrete implementation of a class': false,
        'To create an instance of a class': false,
        'To provide a contract for classes to implement': true,
        'To store data in a structured format': false,
      },
    ),
    Question(
      id: '2',
      title: 'What is a lambda expression in Java?',
      options: {
        'A type of exception': false,
        'A single-line method implementation': true,
        'A keyword to declare variables': false,
        'A built-in data structure': false,
      },
    ),
    Question(
      id: '3',
      title: 'In Python, what is the purpose of the `super()` function?',
      options: {
        'To declare a superclass': false,
        'To invoke a method from the parent class': true,
        'To define a subclass': false,
        'To create an instance of a class': false,
      },
    ),
    Question(
      id: '4',
      title: 'What is the Python `asyncio` library used for?',
      options: {
        'Creating graphical user interfaces': false,
        'Managing asynchronous operations and coroutines': true,
        'Handling exceptions in the code': false,
        'Generating random numbers': false,
      },
    ),
    Question(
      id: '5',
      title: 'What does the `@Override` annotation indicate in Java?',
      options: {
        'A method that is not yet implemented': false,
        'A method that is inherited from a superclass': false,
        'A method that overrides a superclass method': true,
        'A method with multiple return values': false,
      },
    ),
  ];

}