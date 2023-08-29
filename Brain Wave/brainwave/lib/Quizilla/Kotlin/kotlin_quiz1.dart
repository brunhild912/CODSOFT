import 'package:brainwave/Quizilla/Models/build_quiz_page.dart';
import 'package:flutter/material.dart';

import '../Models/question_model.dart';

class KotlinQuiz1 extends StatefulWidget {
  static const id = 'kotlin_quiz1';
  const KotlinQuiz1({super.key});

  @override
  State<KotlinQuiz1> createState() => _KotlinQuiz1State();
}

class _KotlinQuiz1State extends State<KotlinQuiz1> {
  @override
  Widget build(BuildContext context) {
    return BuildQuizPage(
      quizTitle: 'Kotlin Kickstart',
      countDownSeconds: 900,
      questions: kotlinKickstartQuestions,
    );
  }
  List<Question> kotlinKickstartQuestions = [
    Question(
      id: '1',
      title: 'Kotlin is a programming language developed by which company?',
      options: {
        'Google': true,
        'Apple': false,
        'Microsoft': false,
        'Amazon': false,
      },
    ),
    Question(
      id: '2',
      title: 'What is the primary purpose of Kotlin?',
      options: {
        'Web development': false,
        'Mobile app development': true,
        'Game development': false,
        'Database management': false,
      },
    ),
    Question(
      id: '3',
      title: 'Which feature of Kotlin promotes concise and safe coding?',
      options: {
        'Null safety': true,
        'Global variables': false,
        'GOTO statements': false,
        'Multiple inheritance': false,
      },
    ),
    Question(
      id: '4',
      title: 'What is the default visibility modifier in Kotlin?',
      options: {
        'public': false,
        'private': false,
        'protected': false,
        'internal': true,
      },
    ),
    Question(
      id: '5',
      title: 'What is a nullable type in Kotlin?',
      options: {
        'A type that cannot be null': false,
        'A type that can hold null values': true,
        'A type with strict type checking': false,
        'A type with limited functionality': false,
      },
    ),
  ];

}
