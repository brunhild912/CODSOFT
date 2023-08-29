// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'dart:async';

import 'package:brainwave/pages/build_result_page.dart';
import 'package:brainwave/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import '../Quizilla/Models/question_widget.dart';

import '../Quizilla/Models/option_card.dart';
import '../Quizilla/Models/question_model.dart';

class BuildQuizPage extends StatefulWidget {
  static const id = 'build_quiz_page';
  final String quizTitle;
  final int countDownSeconds;
  final List<Question> questions;
  const BuildQuizPage({super.key, this.quizTitle='Title', this.countDownSeconds = 0, this.questions = const []});

  @override
  State<BuildQuizPage> createState() => _BuildQuizPageState();
}

class _BuildQuizPageState extends State<BuildQuizPage> {
int index = 0;
bool isClicked = false;
int score = 0;
bool allQuestionsAnswered = false;
late int endTime;
late String _quizTitle;
late int _countDownSeconds;
late List<Question> _questions;

@override
  void initState() {
    _quizTitle = widget.quizTitle;
    _countDownSeconds = widget.countDownSeconds;
    endTime = DateTime.now().millisecondsSinceEpoch + (_countDownSeconds * 1000);
    _questions = widget.questions;
    super.initState();
  }


void _nextQuestion(){
  if (index == _questions.length - 1){
    allQuestionsAnswered = true;
    setState(() {});
    return;
  } else {
    if (isClicked) {
      setState(() {
        index++;
        isClicked = false;
      });
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please select an option'),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(vertical: 20.0),
      ));
    }
  }
}

void _changeColor (int questionIndex, int optionIndex){
  setState(() {
      _questions[questionIndex].selectedOption = optionIndex;
    });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 50.0),
            child: Row(
              children: [
                Container(
                  width: 50,
                    height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kPrimaryColor,
                  ),
                  child: IconButton(
                    onPressed: (){Navigator.pop(context); },
                    icon: Icon(
                      Icons.chevron_left_rounded,
                      color: kGreyColor,
                    ),
                  ),
                ),
                SizedBox(width: 100.0,),
                Text(_quizTitle,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 16.0,
                ),),
              ],
            ),
          ),
          Container(
            width: 60,
              height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kPrimaryColor,
              ),
            child: Center(
              child: CountdownTimer(
                endTime: endTime,
                widgetBuilder: (_, CurrentRemainingTime? time) {
                  if (time == null) {
                    return Text("Time's up", style: TextStyle(color: Colors.red));
                  } else {
                    return Text(
                      '${time.min.toString().padLeft(2, '0')}:${time.sec.toString().padLeft(2, '0')}',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: kAccentColor),
                    );
                  }
                },
              ),
            ),
            ),
          Container(
            width: double.infinity,
            child: Column(
              children: [
                QuestionWidget(question: _questions[index].title, indexAction: index, totalQuestions: _questions.length),
                const SizedBox(height: 30.0,),
                for (int i = 0; i < _questions[index].options.length; i++)
                  Column(
                    children: [
                      GestureDetector(
                        child: OptionCard(
                            option: _questions[index].options.keys.toList()[i],
                          color: _getTileColor(index, i),
                          textColor: _getTileTextColor(index, i),
                          onTap: () {_changeColor(index, i);
                              isClicked = true;},
                        ),
                      ),
                      SizedBox(height: 20.0,),
                    ],
                  )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: allQuestionsAnswered
      ? GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultPage(score: score),
            ),
          );
        },
        child: Container(
          width: 350,
          height: 50,
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              'Result',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
          ),
        ),
      )
      : BuildFabButton(
        nextQuestion: _nextQuestion,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }


  Color _getTileColor(int questionIndex, int optionIndex) {
    if (_questions[questionIndex].selectedOption == optionIndex) {
      if (_questions[questionIndex].options[_questions[questionIndex].options.keys.toList()[optionIndex]] == true) {
        score = score +5;
        return kCorrectAnswerColor;
      } else {
        return kFalseAnswerColor;
      }
    }
    return kPrimaryColor;
  }

  Color _getTileTextColor(int questionIndex, int optionIndex) {
    if (_questions[questionIndex].selectedOption == optionIndex) {
      return kPrimaryColor;
    }
    return kTextColor;
  }
}

class BuildFabButton extends StatelessWidget {
  final VoidCallback nextQuestion;
  const BuildFabButton({
    required this.nextQuestion,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextQuestion,
      child: Container(
        width: 350,
        height: 50,
        decoration: BoxDecoration(
          color: kAccentColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            'Next',
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}

