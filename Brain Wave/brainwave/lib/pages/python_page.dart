// ignore_for_file: prefer_const_constructors

import 'package:brainwave/Quizilla/Python/python_quiz1.dart';
import 'package:brainwave/components/build_category_page.dart';
import 'package:flutter/material.dart';

import '../Quizilla/Python/python_quiz2.dart';

class PythonPage extends StatefulWidget {
  static const id = 'python_page.dart';
  const PythonPage({super.key});

  @override
  State<PythonPage> createState() => _PythonPageState();
}

class _PythonPageState extends State<PythonPage> {

  @override
  Widget build(BuildContext context) {
    return BuildCategoryPage(
        color1: Color(0xff5168BD),
        color2: Color(0xffF9B90C),
        pageTitle: 'PYTHON',
        titleImage: 'assets/images/Lpython.png',
        categoryRating: '4.6',
        quizTitle: 'PuzzlePython',
        quizDescription: ' Unravel the Snakes and Ladders of Code',
        LessonImagePath1: 'assets/images/Lesson_img3.png',
        LessonImagePath2: 'assets/images/Lesson_img4.png',
        LessonTitleText1: 'Python Code Conundrums',
        LessonTitleText2: 'Python Puzzlers',
        LessonTimeText1: '15:00 mins',
        LessonTimeText2: '10:00 mins',
      onTap1: (){ Navigator.pushNamed(context, PythonQuiz1.id);},
      onTap2: (){ Navigator.pushNamed(context, PythonQuiz2.id);},
    );
  }
}
