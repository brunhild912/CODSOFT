// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:brainwave/components/constants.dart';
import 'package:flutter/material.dart';

import '../Quizilla/Dart/dart_quiz1.dart';
import '../Quizilla/Dart/dart_quiz2.dart';
import '../components/build_category_page.dart';
import '../components/build_lesson_container.dart';

class DartPage extends StatefulWidget {
  static const id = 'dart_page';
  const DartPage({super.key});

  @override
  State<DartPage> createState() => _DartPageState();
}

class _DartPageState extends State<DartPage> {
  @override
  Widget build(BuildContext context) {
    return BuildCategoryPage(
      color1: Colors.white,
      color2: Color(0xff4084D5),
      pageTitle: 'DART',
      titleImage: 'assets/images/Ldart.png',
      categoryRating: '4.9',
      quizTitle: 'DartMinds: Code Challenge',
      quizDescription: 'Elevate your Dart expertise with this dynamic quiz\nand '
          'test your language prowess in an engaging way.',
      LessonImagePath1: 'assets/images/Lesson_img1.png',
      LessonImagePath2: 'assets/images/Lesson_img2.png',
      LessonTitleText1: 'Dart Basics: Fundamentals',
      LessonTitleText2: 'Advanced Dart: Async Programming',
      LessonTimeText1: '20:00 min',
      LessonTimeText2: '15:00 min',
      onTap1: (){Navigator.pushNamed(context, DartQuiz1.id);},
      onTap2: (){ Navigator.pushNamed(context, DartQuiz2.id);},

    );
  }
}
