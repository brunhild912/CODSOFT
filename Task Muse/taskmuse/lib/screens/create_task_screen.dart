// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/constants.dart';
import '../components/todo.dart';

class CreateTaskScreen extends StatefulWidget {
  static const id = 'create_task_screen';

  final String taskTitle;
  final DateTime? taskDate;
  final String taskPriority;
  final String taskDescription;
  final String taskID;

  const CreateTaskScreen({super.key,
    this.taskTitle = 'No Task name',
    this.taskDate,
    this.taskPriority = 'choose priority',
    this.taskDescription = '',
  this.taskID = '',});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  late DateTime sTaskDate;
  late String sTaskTitle;
  late String sTaskPriority;
  late String sTaskDescription;
  late String sTaskID;

  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    sTaskTitle = widget.taskTitle;
    sTaskDate = widget.taskDate ?? DateTime.now();
    sTaskPriority = widget.taskPriority;
    sTaskDescription = widget.taskDescription;
    sTaskID = widget.taskID;

    _titleController = TextEditingController();
    _descriptionController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTextColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Text(
          'Create a New Task!',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: (){
              _saveTodoDetails();
          },
          icon: Icon(
            Icons.chevron_left_rounded,
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            setState(() {

            });
          },
            icon:Icon(
              Icons.edit_note_rounded,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 7.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                contentPadding:
                EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
                border: InputBorder.none,
                hintText: 'Enter Title',
                hintStyle: TextStyle(
                  fontSize: 14.0,
                  color: kBlueGreyColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              // Apply custom style to the entered text
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
              onChanged: (value) {
                setState(() {
                  sTaskTitle = value;
                });
              },
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 7.0),
            child: Row(
              children: [
                Icon(
                  Icons.access_time_rounded,
                  color: kAccentColor,
                  size: 20.0,
                ),
                SizedBox(width: 10.0),
                Text(
                  DateFormat('MMMM d, y').format(sTaskDate),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'FiraCode',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 7.0,),
            child: Row(
              children: [
                Icon(Icons.add,
                  color: kAccentColor,
                  size: 20.0,),
                SizedBox(width: 10.0),
                DropdownButton<String>(
                  value: sTaskPriority,
                  hint: Text(
                    'Choose Priority',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),),
                  onChanged: (value) {
                    setState(() {
                      sTaskPriority = value!;
                    });
                  },
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                  dropdownColor: Colors.white,
                  elevation: 4,
                  icon: Icon(
                    Icons.arrow_drop_down_rounded,
                    size: 25.0,
                    color: kAccentColor,
                  ),
                  items: <String>['choose priority', 'low', 'high', 'none',]
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                        style: TextStyle(
                          color: value == sTaskPriority ? Colors.black : Colors.black,
                          fontWeight: value == sTaskPriority ? FontWeight.w600 : FontWeight.normal,
                          fontFamily: value == sTaskPriority ? 'FiraCode' : null,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                contentPadding:
                EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
                border: InputBorder.none,
                hintText: 'Enter the task\'s description',
                hintStyle: TextStyle(
                  fontSize: 15.0,
                  color: kBlueGreyColor,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  sTaskDescription = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _saveTodoDetails() async {
    final prefs = await SharedPreferences.getInstance();
    sTaskTitle = _titleController.text;
    sTaskDescription = _descriptionController.text;

    final newTodo = Todo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: sTaskTitle,
      description: sTaskDescription,
      date: sTaskDate,
      priority: sTaskPriority,
    );

    await prefs.setString('newTaskid', DateTime.now().millisecondsSinceEpoch.toString(),);
    await prefs.setString('newTaskTitle', sTaskTitle);
    await prefs.setString('newTaskDescription', sTaskDescription);
    await prefs.setString('newTaskPriority', sTaskPriority);
    await prefs.setString('newTaskDate', sTaskDate.toString());

    Navigator.pop(context, newTodo);

  }

}
