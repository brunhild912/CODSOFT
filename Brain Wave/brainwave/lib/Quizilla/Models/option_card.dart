// ignore_for_file: prefer_const_constructors

import 'package:brainwave/components/constants.dart';
import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String option;
  final Color color;
  final Color textColor;
  final VoidCallback onTap;

  const OptionCard({super.key, required this.option, required this.color, required this.onTap, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 400,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: kLightGreyColor,
            width: 2.0,
          ),
          color: color,
        ),
        child: Center(
          child: Text(
              option,
              style: TextStyle(
                fontSize: 15.0,
                color: textColor,
              ),
            ),
        ),
      ),
    );
  }
}
