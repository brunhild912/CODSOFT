// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'constants.dart';

class BuildLessonContainer extends StatelessWidget {
  final String imagePath;
  final String titleText;
  final String timeText;
  final VoidCallback onTap;
  const BuildLessonContainer({
    required this.imagePath,
    required this.titleText,
    required this.timeText,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 400,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              color: kLightGreyColor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0,),
                  child: Image.asset(imagePath),
                ),
                SizedBox(width: 20.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.0,),
                    Text(titleText,
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                      ),),
                    SizedBox(height: 13.0,),
                    Row(
                      children: [
                        Icon(Icons.access_time_rounded,color: Color(0xff25ac94),
                        size: 17.0,),
                        SizedBox(width: 5.0,),
                        Text(timeText,
                          style: TextStyle(
                            color: kGreyColor,
                            fontSize: 15.0,
                          ),),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
