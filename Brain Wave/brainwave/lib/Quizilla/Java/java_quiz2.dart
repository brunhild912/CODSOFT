import 'package:flutter/material.dart';

import '../Models/build_quiz_page.dart';
import '../Models/question_model.dart';

class JavaQuiz2 extends StatefulWidget {
  static const id = 'java_quiz2';
  const JavaQuiz2({super.key});

  @override
  State<JavaQuiz2> createState() => _JavaQuiz2State();
}

class _JavaQuiz2State extends State<JavaQuiz2> {
  @override
  Widget build(BuildContext context) {
    return BuildQuizPage(
      quizTitle: 'Crunching Collections',
      countDownSeconds: 600,
      questions: crunchingCollectionsQuestions,
    );
  }
  List<Question> crunchingCollectionsQuestions = [
    Question(
      id: '1',
      title: 'What is a List in Java?',
      options: {
        'A single element': false,
        'A collection of elements with duplicate values': true,
        'A key-value pair': false,
        'An object that holds only integers': false,
      },
    ),
    Question(
      id: '2',
      title: 'Which interface represents a collection that does not allow duplicate elements?',
      options: {
        'Set': true,
        'List': false,
        'Map': false,
        'Queue': false,
      },
    ),
    Question(
      id: '3',
      title: 'What is the purpose of the Java ArrayList class?',
      options: {
        'To store key-value pairs': false,
        'To maintain a collection of unique elements': false,
        'To store a resizable array of objects': true,
        'To store a fixed-size array of primitive values': false,
      },
    ),
    Question(
      id: '4',
      title: 'What is the difference between ArrayList and LinkedList?',
      options: {
        'ArrayList allows faster insertion and deletion': false,
        'LinkedList is more memory-efficient': true,
        'ArrayList is a linked data structure': false,
        'LinkedList has a fixed size': false,
      },
    ),
    Question(
      id: '5',
      title: 'Which collection class allows you to store elements in a sorted order?',
      options: {
        'List': false,
        'Set': false,
        'SortedSet': true,
        'Queue': false,
      },
    ),
  ];
}