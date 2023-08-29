// ignore_for_file: prefer_const_constructors

import 'package:brainwave/components/constants.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final String question;
  final int indexAction;
  final int totalQuestions;

  const QuestionWidget({super.key,
  required this.question,
  required this.indexAction,
  required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Text('Question ${indexAction+1} / $totalQuestions: $question',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: kTextColor,
          ),),
      ),
    );
  }
}
