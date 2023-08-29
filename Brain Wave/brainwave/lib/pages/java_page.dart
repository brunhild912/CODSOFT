// ignore_for_file: prefer_const_constructors

import 'package:brainwave/Quizilla/Java/java_quiz2.dart';
import 'package:brainwave/components/build_category_page.dart';
import 'package:flutter/material.dart';

import '../Quizilla/Java/java_quiz1.dart';

class JavaPage extends StatefulWidget {
  static const id = 'java_page.dart';
  const JavaPage({super.key});

  @override
  State<JavaPage> createState() => _JavaPageState();
}

class _JavaPageState extends State<JavaPage> {
  @override
  Widget build(BuildContext context) {
    return BuildCategoryPage(
        color1: Color(0xff4C7491),
        color2: Color(0xffE51F24),
        pageTitle: 'JAVA',
        titleImage: 'assets/images/Ljava.png',
        categoryRating: '4.5',
        quizTitle: 'Java Geniuses',
        quizDescription: 'Navigating the Realm of Object-Oriented Brilliance',
        LessonImagePath1: 'assets/images/Lesson_img5.png',
        LessonImagePath2: 'assets/images/Lesson_img6.png',
        LessonTitleText1: 'Objects in Motion',
        LessonTitleText2: 'Crunching Collections',
        LessonTimeText1: '15:00 mins',
        LessonTimeText2: '10:00 mins',
      onTap1: (){ Navigator.pushNamed(context, JavaQuiz1.id);},
      onTap2: (){ Navigator.pushNamed(context, JavaQuiz2.id);},
    );
  }
}
