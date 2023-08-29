// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:brainwave/Quizilla/Python/python_quiz1.dart';
import 'package:brainwave/Quizilla/Python/python_quiz2.dart';
import 'package:brainwave/Quizilla/polyglot_quiz.dart';
import 'package:brainwave/components/constants.dart';
import 'package:brainwave/pages/python_page.dart';
import 'package:flutter/material.dart';

import '../../pages/dart_page.dart';
import '../../pages/home_page.dart';
import '../../pages/java_page.dart';
import '../../pages/kotlin_page.dart';
import '../Dart/dart_quiz1.dart';
import '../Dart/dart_quiz2.dart';
import '../Java/java_quiz1.dart';
import '../Java/java_quiz2.dart';
import '../Kotlin/kotlin_quiz1.dart';
import '../Kotlin/kotlin_quiz2.dart';

class ResultPage extends StatefulWidget {
  static const id = 'result_page';
  final int score;
  const ResultPage({super.key, this.score = 0});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late int score;
  @override
  void initState() {
    score = widget.score;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){Navigator.pushNamed(context, HomePage.id);}, icon: Icon(Icons.home)),
                Text('Result',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(onPressed: (){
                  String mainPageRoute = '/';
                  if (ModalRoute.of(context)?.settings.name == PythonQuiz1.id) {
                    mainPageRoute = PythonPage.id;
                  } else if (ModalRoute.of(context)?.settings.name == PythonQuiz2.id) {
                    mainPageRoute = PythonPage.id;
                  }
                  else if (ModalRoute.of(context)?.settings.name == DartQuiz1.id) {
                    mainPageRoute = DartPage.id;
                  }
                    else if (ModalRoute.of(context)?.settings.name == DartQuiz2.id) {
                    mainPageRoute = DartPage.id;
                  }
                  else if (ModalRoute.of(context)?.settings.name == KotlinQuiz1.id) {
                    mainPageRoute = KotlinPage.id;
                  }
                  else if (ModalRoute.of(context)?.settings.name == KotlinQuiz2.id) {
                    mainPageRoute = KotlinPage.id;
                  }
                  else if (ModalRoute.of(context)?.settings.name == JavaQuiz1.id) {
                    mainPageRoute = JavaPage.id;
                  }
                  else if (ModalRoute.of(context)?.settings.name == JavaQuiz2.id) {
                    mainPageRoute = JavaPage.id;
                  }
                  else if (ModalRoute.of(context)?.settings.name == PolyglotQuiz.id) {
                    mainPageRoute = HomePage.id;
                  }

                  Navigator.popUntil(context, ModalRoute.withName(mainPageRoute));
                  },
                    icon: Icon(Icons.cancel)),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
            Container(
              width: 330,
              height: 100,
              decoration: BoxDecoration(
                color: kAccentColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 35.0),
                child: Row(
                  children: [
                    SizedBox(width: 20,),
                    score > 15 ? Icon(Icons.star,
                    color: Colors.orange,
                      size: 40.0,
                    ) : Icon(
                        Icons.receipt_sharp,
                      color: kLightGreyColor,
                      size: 40.0,
                    ),
                    SizedBox(width: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        score < 10 ? Text('Your Score is: 0$score',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),)
                        : Text('Your Score is: $score',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),),
                        SizedBox(height: 10.0,),
                        score > 15 ? Text('Congrats! You\'re \nintermediate now.',
                          style: TextStyle(
                            color: kGreyColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ) : Text('Try harder next time... ',
                          style: TextStyle(
                            color: kGreyColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
  Container buildIconButton(Function onPressed, IconData icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kPrimaryColor,
      ),
      child: IconButton(
        onPressed: (){
          setState(() {
            onPressed;
          });
        },
        icon: Icon(
          icon,
          color: kGreyColor,
        ),
      ),
    );
  }
}
