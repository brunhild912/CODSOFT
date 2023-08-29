// ignore_for_file: prefer_const_constructors

import 'package:brainwave/Quizilla/Kotlin/kotlin_quiz1.dart';
import 'package:flutter/material.dart';

import '../Quizilla/Kotlin/kotlin_quiz2.dart';
import '../components/build_category_page.dart';

class KotlinPage extends StatefulWidget {
  static const id = 'kotlin_page.dart';
  const KotlinPage({super.key});

  @override
  State<KotlinPage> createState() => _KotlinPageState();
}

class _KotlinPageState extends State<KotlinPage> {
  @override
  Widget build(BuildContext context) {
    return BuildCategoryPage(
        color1: Color(0xffD56B6D),
        color2: Color(0xffA32BE5),
        pageTitle: 'KOTLIN',
        titleImage: 'assets/images/Lkotlin.png',
        categoryRating: '4.0',
        quizTitle: 'Kotlin Koalas',
        quizDescription: 'Dive into Kotlin\'s concise syntax and functional powers. '
            'and explore sleek streams in this dynamic language.',
        LessonImagePath1: 'assets/images/8.PNG',
        LessonImagePath2: 'assets/images/9.PNG',
        LessonTitleText1: 'Kotlin Kickstart',
        LessonTitleText2: 'Sleek Streams and Beyond',
        LessonTimeText1: '10:00 mins',
        LessonTimeText2: '15:00 mins',
      onTap1: (){ Navigator.pushNamed(context, KotlinQuiz1.id);},
      onTap2: (){ Navigator.pushNamed(context, KotlinQuiz2.id);},
    );
  }
}
