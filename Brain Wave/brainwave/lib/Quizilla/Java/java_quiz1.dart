import 'package:brainwave/pages/build_quiz_page.dart';
import 'package:flutter/material.dart';

import '../Models/question_model.dart';

class JavaQuiz1 extends StatefulWidget {
  static const id = 'java_quiz1';
  const JavaQuiz1({super.key});

  @override
  State<JavaQuiz1> createState() => _JavaQuiz1State();
}

class _JavaQuiz1State extends State<JavaQuiz1> {
  @override
  Widget build(BuildContext context) {
    return BuildQuizPage(
      quizTitle: 'Objects in Motion',
      countDownSeconds: 900,
      questions: objectsInMotionQuestions,
    );
  }
  List<Question> objectsInMotionQuestions = [
    Question(
      id: '1',
      title: 'What is velocity?',
      options: {
        'The speed of an object': true,
        'The distance traveled by an object': false,
        'The force applied to an object': false,
        'The mass of an object': false,
      },
    ),
    Question(
      id: '2',
      title: 'Which equation represents Newton\'s second law of motion?',
      options: {
        'F = ma': true,
        'E = mc²': false,
        'P = mv': false,
        'E = hv': false,
      },
    ),
    Question(
      id: '3',
      title: 'What is acceleration?',
      options: {
        'Change in position over time': false,
        'Change in velocity over time': true,
        'Force applied to an object': false,
        'Distance traveled by an object': false,
      },
    ),
    Question(
      id: '4',
      title: 'What is inertia?',
      options: {
        'A force that opposes motion': false,
        'The tendency of an object to stay at rest or in motion': true,
        'The rate of change of velocity': false,
        'The force exerted by a mass': false,
      },
    ),
    Question(
      id: '5',
      title: 'What is a projectile?',
      options: {
        'A moving object': false,
        'An object in motion with a curved trajectory': true,
        'An object at rest': false,
        'An object with zero acceleration': false,
      },
    ),
  ];
}
