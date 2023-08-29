// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'build_lesson_container.dart';
import 'constants.dart';

class BuildCategoryPage extends StatelessWidget {
  final Color color1;
  final Color color2;
  final String pageTitle;
  final String titleImage;
  final String categoryRating;
  final String quizTitle;
  final String quizDescription;
  final String LessonImagePath1;
  final String LessonImagePath2;
  final String LessonTitleText1;
  final String LessonTitleText2;
  final String LessonTimeText1;
  final String LessonTimeText2;
  final VoidCallback onTap1;
  final VoidCallback onTap2;

  const BuildCategoryPage({
    required this.color1,
    required this.color2,
    required this.pageTitle,
    required this.titleImage,
    required this.categoryRating,
    required this.quizTitle,
    required this.quizDescription,
    required this.LessonImagePath1,
    required this.LessonImagePath2,
    required this.LessonTitleText1,
    required this.LessonTitleText2,
    required this.LessonTimeText1,
    required this.LessonTimeText2,
    required this.onTap1,
    required this.onTap2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.maxFinite,
                height: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [color1, color2],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 25.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        pageTitle,
                        style: TextStyle(
                          letterSpacing: 3.0,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900,
                          color: kPrimaryColor,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Image.asset(
                        titleImage,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 30,
                  left: 20,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      shape: BoxShape.circle,
                    ),
                      child: IconButton(
                    icon: Icon(Icons.chevron_left_rounded,
                    size: 20.0,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),),),
              Positioned(
                top: 260,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 50,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: kGreyColor,
                      size: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 540,
            width: double.maxFinite,
            color: kPrimaryColor,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 17.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        categoryRating,
                        style: TextStyle(
                          color: kGreyColor,
                          fontFamily: 'Roboto',
                          fontSize: 18.0,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 13.0,
                  ),
                  Text(
                    quizTitle,
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 19.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 13.0,
                  ),
                  Text(
                    quizDescription,
                    style: TextStyle(
                      color: kGreyColor,
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Divider(
                    height: 20,
                    color: kLightGreyColor,
                    thickness: 1.0,
                    indent: 0,
                    endIndent: 0,
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Text(
                    'Lessons',
                    style: TextStyle(
                      color: kTextColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 19.0,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  BuildLessonContainer(
                    imagePath: LessonImagePath1,
                    titleText: LessonTitleText1,
                    timeText: LessonTimeText1,
                    onTap: onTap1,
                  ),
                  BuildLessonContainer(
                    imagePath: LessonImagePath2,
                    titleText: LessonTitleText2,
                    timeText: LessonTimeText2,
                    onTap: onTap2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
