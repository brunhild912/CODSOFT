// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/constants.dart';
import '../components/todo.dart';

class ViewTaskDetailsScreen extends StatefulWidget {
  static const id = 'view_task_details_screen';

  final String taskTitle;
  final DateTime? taskDate;
  final String taskPriority;
  final String taskDescription;
  final String taskID;
  final bool isEditing;

  const ViewTaskDetailsScreen({
    super.key,
    this.taskTitle = 'No Task name',
    this.taskDate,
    this.taskPriority = 'none',
    this.taskDescription = '',
    this.taskID = '',
    this.isEditing = false,
  });

  @override
  State<ViewTaskDetailsScreen> createState() => _ViewTaskDetailsScreenState();
}

class _ViewTaskDetailsScreenState extends State<ViewTaskDetailsScreen> {
  late DateTime sTaskDate;
  late String sTaskTitle;
  late String sTaskPriority;
  late String sTaskDescription;
  late String sTaskID;

  late String editedTitle;
  late String editedPriority;
  late String editedDescription;
  late bool sIsEditing;

  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _priorityController;

  @override
  void initState() {
    sTaskTitle = widget.taskTitle;
    sTaskDate = widget.taskDate!;
    sTaskPriority = widget.taskPriority;
    sTaskDescription = widget.taskDescription;
    sTaskID = widget.taskID;
    sIsEditing = widget.isEditing;

    if(widget.isEditing){
      editedTitle = sTaskTitle;
      editedDescription = sTaskDescription;
      editedPriority = sTaskPriority;
    }

    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _priorityController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color priorityColor;

    return Scaffold(
      backgroundColor: kTextColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Text(
          sTaskTitle!,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            setState(() {
              _saveTodoDetails();
            });
          },
          icon: Icon(
            Icons.chevron_left_rounded,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                sIsEditing = true;
              });
            },
            icon: Icon(
              Icons.edit_note_rounded,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 7.0),
            //if editing true then ...
            child: sIsEditing ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 7.0),
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
                  border: InputBorder.none,
                  hintText: sTaskTitle,
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
            )
            : Text(
              sTaskTitle!,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: kBlueGreyColor,
                fontSize: 22.0,
              ),
            )
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
                  color: kPrimaryColor,
                  size: 20.0,
                ),
                SizedBox(width: 10.0),
                Text(
                  DateFormat('MMMM d, y')
                      .format(sTaskDate), // Format the selected date
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'FiraCode',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          sIsEditing ? Padding(
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
                    sTaskPriority!,
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
          )
          : Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 7.0,
            ),
            child: Container(
              margin: EdgeInsets.all(10.0),
              width: 50.0,
              height: 30.0,
              decoration: BoxDecoration(
                color: kAccentColor,
              ),
              child: Center(
                child: Text(
                  sTaskPriority!,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'FiraCode',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          sIsEditing ? Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                contentPadding:
                EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
                border: InputBorder.none,
                hintText: sTaskDescription,
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
          )
          : Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              sTaskDescription!,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _saveTodoDetails() async{
    final prefs = await SharedPreferences.getInstance();
    editedTitle = _titleController.text;
    editedDescription = _descriptionController.text;
    editedPriority = _priorityController.text;

    final editedTodo = Todo(
      id: sTaskID,
      title: editedTitle,
      description: editedDescription,
      date: sTaskDate,
      priority: editedPriority,
    );

    await prefs.setString('newTaskid', sTaskID);
    await prefs.setString('newTaskTitle',editedTitle);
    await prefs.setString('newTaskDescription', editedDescription);
    await prefs.setString('newTaskPriority', editedPriority);
    await prefs.setString('newTaskDate', sTaskDate.toString());

    Navigator.pop(context, editedTodo);
  }
}
