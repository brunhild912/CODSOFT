// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskmuse/screens/create_task_screen.dart';
import 'package:taskmuse/screens/view_task_details_screen.dart';
import 'package:taskmuse/screens/tasklist_screen.dart';

import 'components/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(TaskMuse());
}

class TaskMuse extends StatelessWidget {

  const TaskMuse({super.key});


  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: kSecondaryColor,
          selectionHandleColor: kSecondaryColor,
          cursorColor: kSecondaryColor,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: kAccentColor,
          hoverColor: kSecondaryColor,
        )
      ),
      home: TasklistScreen(),
      initialRoute: TasklistScreen.id,
      routes: {
        TasklistScreen.id: (context) => TasklistScreen(),
        CreateTaskScreen.id: (context) => CreateTaskScreen(),
        ViewTaskDetailsScreen.id: (context) => ViewTaskDetailsScreen(),
      },
    );
  }
}