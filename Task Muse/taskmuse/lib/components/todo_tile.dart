// ignore_for_file: prefer_typing_uninitialized_variables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:taskmuse/components/todo.dart';

import 'constants.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;
  final onDeleted;
  final onChecked;
  final onLongPressed;
  const TodoTile({required this.todo, required this.onDeleted, required this.onChecked, required this.onLongPressed,});

  @override
  Widget build(BuildContext context) {
    Color priorityColor;
    String priority;

    if (todo.priority == 'low') {
      priorityColor = Colors.green;
      priority = 'low';
    } else if (todo.priority == 'high') {
      priorityColor = Colors.yellowAccent;
      priority = 'high';
    } else {
      priorityColor = Colors.red;
      priority = 'no priority';
    }

    return GestureDetector(
      onLongPress: (){
        onLongPressed(todo);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: ListTile(
          onTap: (){
            onChecked(todo);
          },
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: kAccentColor,
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                todo.title,
                style: TextStyle(
                  fontSize: 16,
                  color: kTextColor,
                  decoration: todo.isDone ? TextDecoration.lineThrough : null,
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    width: 9,
                    height: 9,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: priorityColor,
                    ),
                  ),
                  Text(
                    priority,
                    style: TextStyle(
                      fontFamily: 'FiraCode',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 14.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ],
          ),
          trailing: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(vertical: 5),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              color: kAccentColor,
              iconSize: 18,
              icon: Icon(Icons.delete),
              onPressed: () {
                onDeleted(todo.id);
              },
            ),
          ),
        ),
      ),
    );
  }
}
