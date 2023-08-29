import 'package:brainwave/pages/build_quiz_page.dart';
import 'package:flutter/material.dart';

import '../Models/question_model.dart';

class PythonQuiz1 extends StatefulWidget {
  static const id = 'python_quiz1';
  const PythonQuiz1({super.key});

  @override
  State<PythonQuiz1> createState() => _PythonQuiz1State();
}

class _PythonQuiz1State extends State<PythonQuiz1> {
  @override
  Widget build(BuildContext context) {
    return BuildQuizPage(
      quizTitle: 'Python Conundrums',
      countDownSeconds: 900,
      questions: pythonCodeConundrumsQuestions,
    );
  }
  List<Question> pythonCodeConundrumsQuestions = [
    Question(
      id: '1',
      title: 'What does the `len()` function do in Python?',
      options: {
        'Returns the last element of a list': false,
        'Counts the number of elements in a collection': true,
        'Finds the maximum value in a list': false,
        'Removes duplicate elements from a list': false,
      },
    ),
    Question(
      id: '2',
      title: 'What is the output of the code: `print(5 + "5")`?',
      options: {
        '10': false,
        '55': true,
        'Error': false,
        'NaN': false,
      },
    ),
    Question(
      id: '3',
      title: 'What is the result of `3 * 2 ** 3` in Python?',
      options: {
        '18': true,
        '12': false,
        '24': false,
        '36': false,
      },
    ),
    Question(
      id: '4',
      title: 'What does the `append()` method do in Python lists?',
      options: {
        'Removes the last element of a list': false,
        'Inserts an element at a specific index': false,
        'Adds an element to the end of a list': true,
        'Creates a new list': false,
      },
    ),
    Question(
      id: '5',
      title: 'What is the output of the code: `print("Hello"[-1])`?',
      options: {
        'H': false,
        'e': false,
        'o': true,
        'l': false,
      },
    ),
  ];
}