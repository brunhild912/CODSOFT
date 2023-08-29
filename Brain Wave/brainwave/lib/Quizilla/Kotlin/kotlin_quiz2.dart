import 'package:brainwave/pages/build_quiz_page.dart';
import 'package:flutter/material.dart';

import '../Models/question_model.dart';

class KotlinQuiz2 extends StatefulWidget {
  static const id = 'kotlin_quiz2';
  const KotlinQuiz2({super.key});

  @override
  State<KotlinQuiz2> createState() => _KotlinQuiz2State();
}

class _KotlinQuiz2State extends State<KotlinQuiz2> {
  @override
  Widget build(BuildContext context) {
    return BuildQuizPage(
      quizTitle: 'Sleek Streams and Beyond',
      countDownSeconds: 600,
      questions: sleekStreamsQuestions,
    );
  }
  List<Question> sleekStreamsQuestions = [
    Question(
      id: '1',
      title: 'What are Kotlin Flow and Kotlin Channel used for?',
      options: {
        'User interface design': false,
        'Asynchronous programming': true,
        'Data encryption': false,
        'Unit testing': false,
      },
    ),
    Question(
      id: '2',
      title: 'What is a Cold Flow in Kotlin?',
      options: {
        'A flow that emits only one value': false,
        'A flow that emits multiple values to multiple subscribers': false,
        'A flow that re-emits values to each subscriber': false,
        'A flow that emits values on demand to each subscriber': true,
      },
    ),
    Question(
      id: '3',
      title: 'What does the `conflate` operator do in Kotlin Flow?',
      options: {
        'Combines two flows into one': false,
        'Merges values from multiple flows': false,
        'Combines the latest emitted value with the next value': true,
        'Drops old values when the collector is slow': false,
      },
    ),
    Question(
      id: '4',
      title: 'What is the purpose of Kotlin Channels?',
      options: {
        'To manage memory allocation': false,
        'To define UI elements in Android apps': false,
        'To provide a way for coroutines to communicate': true,
        'To handle network requests': false,
      },
    ),
    Question(
      id: '5',
      title: 'In Kotlin Flow, what is the difference between `collect` and `launchIn`?',
      options: {
        'They have the same functionality': false,
        '`collect` is used for flow cancellation': false,
        '`launchIn` returns a result value': false,
        '`launchIn` returns a `Job` and does not block': true,
      },
    ),
  ];

}