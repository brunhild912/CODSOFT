import 'package:flutter/material.dart';

class Question {
  final String id;
  final String title;
  final Map <String, bool> options;
  int selectedOption;

  Question({
    required this.id,
    required this.title,
    required this.options,
    this.selectedOption = -1,
  });

  @override
  String toString(){
    return 'Question(id: $id, title: $title, options: $options)';
  }

}
