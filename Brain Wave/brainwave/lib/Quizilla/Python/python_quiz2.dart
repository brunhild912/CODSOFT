import 'package:brainwave/Quizilla/Models/build_quiz_page.dart';
import 'package:flutter/material.dart';

import '../Models/question_model.dart';

class PythonQuiz2 extends StatefulWidget {
  static const id = 'python_quiz2';
  const PythonQuiz2({super.key});

  @override
  State<PythonQuiz2> createState() => _PythonQuiz2State();
}

class _PythonQuiz2State extends State<PythonQuiz2> {
  @override
  Widget build(BuildContext context) {
    return BuildQuizPage(
      quizTitle: 'Python Puzzlers',
      countDownSeconds: 600,
      questions: pythonPuzzlersQuestions,
    );
  }
  List<Question> pythonPuzzlersQuestions = [
    Question(
      id: '1',
      title: 'What does the expression `3 == 3.0` evaluate to in Python?',
      options: {
        'True': true,
        'False': false,
        'Error': false,
        'Undefined': false,
      },
    ),
    Question(
      id: '2',
      title: 'What is the output of the code: `print("Python"[::-1])`?',
      options: {
        'nohtyP': true,
        'Python': false,
        'Error': false,
        'nythoP': false,
      },
    ),
    Question(
      id: '3',
      title: 'What does the expression `None == None` evaluate to?',
      options: {
        'True': true,
        'False': false,
        'Error': false,
        'Undefined': false,
      },
    ),
    Question(
      id: '4',
      title: 'What is the result of `5 / 2` in Python 3?',
      options: {
        '2': false,
        '2.5': true,
        '2.0': false,
        '2.25': false,
      },
    ),
    Question(
      id: '5',
      title: 'What does the code `print(f"{5+5}")` output?',
      options: {
        '10': true,
        'f"{5+5}"': false,
        'Error': false,
        'Undefined': false,
      },
    ),
  ];

}