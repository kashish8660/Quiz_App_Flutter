import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quiz_app/Data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

//Quiz widget does the state management(aka host fragment type)
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers =
      []; //Even though list is final, new elements can be added to the list. 'final' just means that this variable can't be reassigned with a new list.
  @override
  void initState() {
    //is a method that belongs to the State class, which is used to initialize the state of a stateful widget before it is fully constructed.
    super
        .initState(); //super.initState() should come before any additional work(like setting activeScreen here)
    activeScreen = StartScreen(
        switchScreen); //The widget(Quiz) which is passing the function(switchScreen) will contain it's definition
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) { //using 'selectedAnswers' state to decide on Quiz's state
      setState(() {
        // selectedAnswers = [];
        activeScreen = ResultsScreen(chosenAnswers: selectedAnswers, restartQuiz: restartQuiz);
      });
    }
  }

  void switchScreen() {
    //This function is defined in 'Quiz' widget but will be called in 'StartScreen' widget
    setState(() {
      activeScreen = QuestionsScreen(
          onSelectedAnswer: chooseAnswer); //passing function as named argument
    });
  }
  void restartQuiz() {
    selectedAnswers = [];
    setState(() {
      activeScreen = QuestionsScreen(
          onSelectedAnswer: chooseAnswer);
    });
  }
  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: activeScreen,
      ),
    );
  }
}
