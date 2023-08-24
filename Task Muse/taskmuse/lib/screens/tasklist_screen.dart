// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:taskmuse/components/constants.dart';
import 'package:taskmuse/components/todo_tile.dart';
import 'package:taskmuse/screens/view_task_details_screen.dart';

import '../components/todo.dart';
import 'create_task_screen.dart';

class TasklistScreen extends StatefulWidget {
  static const id = 'tasklist_screen';
  const TasklistScreen({super.key});

  @override
  State<TasklistScreen> createState() => _TasklistScreenState();
}

class _TasklistScreenState extends State<TasklistScreen> {
  //declarations
  final newTaskID = DateTime.now().millisecondsSinceEpoch.toString();
  final CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  DateTime _selectedDate = DateTime.now();
  final tasksList = Todo.todoList();
  List<Todo> _foundToDo = [];

  @override
  void initState() {
    _loadDataFromLocalStorage();
    _foundToDo = tasksList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    child: TableCalendar(
                      calendarFormat: _calendarFormat,
                      focusedDay: _focusedDay,
                      firstDay: DateTime.utc(2023, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                          _selectedDate = selectedDay;
                        });
                      },
                      calendarStyle: CalendarStyle(
                          defaultTextStyle: TextStyle(
                            fontFamily: 'FiraCode',
                            color: kSecondaryColor,
                          ),
                          weekendTextStyle: TextStyle(color: kSecondaryColor),
                          todayDecoration: BoxDecoration(
                            shape: BoxShape.circle, // Keep the shape as circle
                            color: Colors
                                .transparent, // Make the circle transparent
                          ),
                          todayTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: kPrimaryColor,
                          ),
                          selectedDecoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: kAccentColor,
                              width: 2.0,
                            ),
                          ),
                          selectedTextStyle: TextStyle(
                            color: kAccentColor,
                          )),
                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleTextStyle: TextStyle(
                          color: kPrimaryColor,
                          // fontFamily: 'FiraCode',// Set month's color
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                        leftChevronIcon: Icon(
                          Icons.arrow_back_ios,
                          size: 15.0,
                          color: kTextColor, // Set left arrow's color
                        ),
                        rightChevronIcon: Icon(
                          Icons.arrow_forward_ios,
                          size: 15.0,
                          color: kTextColor, // Set right arrow's color
                        ),
                      ),
                      daysOfWeekStyle: DaysOfWeekStyle(
                        // Customize days' names style
                        weekdayStyle: TextStyle(
                          color: kTextColor,
                          fontWeight: FontWeight.bold, // Make it bold
                        ),
                        weekendStyle: TextStyle(
                          color: kTextColor,
                          fontWeight: FontWeight.bold, // Make it bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Task Muse',
              style: TextStyle(
                fontFamily: 'FiraCode',
                fontWeight: FontWeight.w900,
                fontSize: 35.0,
                color: kTextColor,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 360,
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              child: ListView(
                children: [
                  for (Todo todoTask in _foundToDo.reversed)
                    StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      return TodoTile(
                        todo: todoTask,
                        onDeleted: _deleteToDoItem,
                        onChecked: _handleToDoChange,
                        onLongPressed: _onLongPressed,
                      );
                    }),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateTaskScreen(taskID: newTaskID,),
                      ),
                    );

                    if(result != null ){
                      _addToDoItem(result.title, result.description, result.priority, result.date);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 10.0,
                    ),
                    height: 50,
                    width: 250, // Adjust the height as needed
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 55.0,
                          ),
                          Icon(
                            Icons.add,
                            color: kAccentColor,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            'Add new task',
                            style: TextStyle(
                              color: kAccentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onLongPressed(Todo todo) async {

    final editedTodo = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ViewTaskDetailsScreen(
          taskID: todo.id,
          taskTitle: todo.title,
          taskDate: todo.date,
          taskPriority: todo.priority,
          taskDescription: todo.description,
        ),
      ),
    );

    if(editedTodo != null){
      int editedTaskIndex = tasksList.indexWhere((element) => element.id == editedTodo.id);
      if(editedTaskIndex != -1){
        setState(() {
          tasksList[editedTaskIndex] = editedTodo;
        });
      }
    }
  }

Future<void> _addToDoItem(String newTaskTitle, String newTaskDescription, String newTaskPriority, DateTime newTaskDate) async {
  final prefs = await SharedPreferences.getInstance();
  final newTodo = Todo(
    id: newTaskID,
    date: newTaskDate,
    description: newTaskDescription,
    title: newTaskTitle,
    priority: newTaskPriority,
  );


  await prefs.setString('newTaskID', newTaskID);
  await prefs.setString('newTaskTitle', newTaskTitle);
  await prefs.setString('newTaskDescription', newTaskDescription);
  await prefs.setString('newTaskPriority', newTaskPriority);
  await prefs.setString('newTaskDate', newTaskDate.toString());


    setState(() {
      tasksList.add(newTodo);
    });
}

  void _handleToDoChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  Future<void> _deleteToDoItem(String id) async {
    final prefs = await SharedPreferences.getInstance();
    // Find the index of the task to be deleted
    int taskIndex = tasksList.indexWhere((item) => item.id == id);
    if (taskIndex != -1) {
    }
      // Delete the task from the list
      setState(() {
        tasksList.removeAt(taskIndex);
      });

    // Delete the task from local storage
    prefs.remove('newTaskID');
    prefs.remove('newTaskTitle');
    prefs.remove('newTaskDescription');
    prefs.remove('newTaskPriority');
    prefs.remove('newTaskDate');
  }

  Future<void> _loadDataFromLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();

    final loadedTaskID = prefs.getString('newTaskID');
    final loadedTaskTitle = prefs.getString('newTaskTitle');
    final loadedTaskDescription = prefs.getString('newTaskDescription');
    final loadedTaskPriority = prefs.getString('newTaskPriority');
    final loadedTaskDate = prefs.getString('newTaskDate');

    if (loadedTaskID != null && loadedTaskDate != null) {  // Check if loadedTaskDate is not null
      final loadedTodo = Todo(
        id: loadedTaskID,
        title: loadedTaskTitle ?? '',  // Use ?? to provide a default value for null
        description: loadedTaskDescription ?? '',
        priority: loadedTaskPriority ?? 'choose priority',
        date: DateTime.parse(loadedTaskDate), // Parse the date
      );

      setState(() {
        tasksList.add(loadedTodo);
      });
    }
  }

}
