// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:brainwave/Quizilla/polyglot_quiz.dart';
import 'package:brainwave/components/constants.dart';
import 'package:brainwave/pages/dart_page.dart';
import 'package:brainwave/pages/python_page.dart';
import 'package:flutter/material.dart';

import 'java_page.dart';
import 'kotlin_page.dart';

class HomePage extends StatefulWidget {
  static const id = 'home_page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                buildIconButton((){ }, Icons.pages_rounded),
                Text('Brain Wave',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                buildIconButton((){ }, Icons.notifications),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            padding: EdgeInsets.all(10.0),
            height: 200,
            width: 400,
            decoration: BoxDecoration(
              color: kAccentColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 25.0,
                ),
                Text('Let\'s learn together!',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Roboto',
                  letterSpacing: 1.0,
                  fontSize: 22.0,
                ),),
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  width: 300,
                  height: 50.0,
                  child: TextField(
                    onChanged: (value){
                      print(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Search for topic...',
                      hintStyle: TextStyle(
                        color: kGreyColor,
                        fontSize: 14.0,
                        fontFamily: 'Roboto',
                      ),
                      prefixIcon: Icon(Icons.search_outlined,
                      color: kGreyColor,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none, // Hide the border
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                    ),
                    style: TextStyle(fontSize: 14,
                    fontFamily: 'Roboto',
                    color: kTextColor, ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.0),
          Container(
            height: 220,
            width: 400,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Categories',
                      style: TextStyle(
                        color: kTextColor,
                        fontFamily: 'Roboto',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),),
                      Text('See all',
                      style: TextStyle(
                        color: kGreyColor,
                        fontSize: 14.0,
                        fontFamily: 'Roboto',
                      ),),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, KotlinPage.id);
                        },
                        child: _buildCategory('assets/images/kotlin.png', 'Kotlin'),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, JavaPage.id);
                        },
                        child: _buildCategory('assets/images/java.png', 'Java'),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, PythonPage.id);
                        },
                        child: _buildCategory('assets/images/python.png', 'Python'),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, DartPage.id);
                        },
                        child: _buildCategory('assets/images/dart.png', 'Dart'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox( height: 20.0),
          Container(
            height: 230,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0),),
              color: kPrimaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 14.0,),
              child: Column(
                children: [
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: kGreyColor,
                  ),
                  SizedBox(height: 17.0,),
                  Row(
                    children: [
                      SizedBox(width:10.0,),
                      Text('Popular Quiz',
                        style: TextStyle(
                          color: kTextColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 19.0,
                        ),),
                    ],
                  ),
                  SizedBox(height: 24.0,),
                  Row(
                    children: [
                      Container(
                        width: 150,
                        height: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: kSecondaryColor,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset('assets/images/Lesson_img2.png',
                          fit: BoxFit.fill,),
                        ),
                      ),
                      SizedBox(width: 19.0,),
                      Container(
                        width: 180,
                        height: 110,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star,
                                color: Colors.orange,
                                size: 14.0,),
                                SizedBox(width: 5.0,),
                                Text('4.9',
                                style: TextStyle(
                                  color: kGreyColor,
                                  fontFamily: 'Roboto',
                                  fontSize: 15.0,
                                ),)
                              ],
                            ),
                            SizedBox(height: 7.0,),
                            Row(
                              children: [
                                Text('Polyglot Code Quiz',
                                style: TextStyle(
                                  color: kTextColor,
                                  fontSize: 16.0,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                ),),
                              ],
                            ),
                            SizedBox(height: 7.0,),
                            Row(
                              children: [
                                Text(
                                  'Python & Java Edition',
                                  style: TextStyle(
                                    color: kGreyColor,
                                    fontSize: 13.0,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pushNamed(context, PolyglotQuiz.id);
                                  },
                                  child: Row(
                                    children: [
                                      Text('Start Quiz',
                                      style: TextStyle(
                                        color: Color(0xff25ac94),
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w900,
                                        fontSize: 15.0,
                                      ),),
                                      SizedBox(width: 10.0,),
                                      Icon(Icons.arrow_right_alt,
                                      color: Color(0xff25ac94),
                                      size: 19.0,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )
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
                      onPressed;
                    },
                    icon: Icon(
                        icon,
                      color: kGreyColor,
                    ),
                ),
              );
  }

  Widget _buildCategory(String imagePath, String categoryName) {
    return Column(
      children: [
        Container(
          width: 80,
        height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kPrimaryColor,
          ),
          child: Image(
            image: AssetImage(imagePath,
              ),
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: 8),
        Text(
          categoryName,
          style: TextStyle(
            color: kGreyColor,
            fontFamily: 'Roboto',
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }


}
