import 'package:flutter/material.dart';

class Todo {
  final String id;
  final String title;
  final String description;
  final String priority;
  final DateTime date;
  bool isDone;

  Todo({required this.id, required this.title, required this.date,
    this.priority = 'choose priority', this.description = '', this.isDone = false,});

  static List<Todo> todoList() {
    return [
      Todo(id: '01', title: 'Learn a new language', isDone: true, priority: 'low', date: DateTime.now(), description: 'Learn Turkish for 20 mins, do atleast 1 chapter complete.'),
      Todo(id: '02', title: 'Mark the checklist', isDone: false, priority: 'none', date: DateTime.now(),),
      Todo(id: '03', title: 'Check Emails', priority: 'high', date: DateTime.now(),),
    ];
  }

}