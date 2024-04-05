import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/Data/questions.dart';
import 'models/quiz_question.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectedAnswer});
  final void Function(String answer) onSelectedAnswer;
  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  late var currentQuestion;
  var questionNumber = 0;
  void nextQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer); //'widget' is a pre-defined property that is used if we want to use properties of 'StatefulWidget' class
    setState(() {
        questionNumber++;
    });
  }

  @override
  void initState() {
    currentQuestion = questions[questionNumber]; //Using the 'list' directly defined in 'questions.dart' file
  }

  @override
  Widget build(context) {
    currentQuestion = questions[questionNumber];
    return Center(
      child: SizedBox(
        width: 300,
        child: Container(
          margin: const EdgeInsets.all(20),
          //margin argument is available in Container widget
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  currentQuestion.text,
                  // style: const TextStyle(color: Colors.white, fontSize: 20), //without Google font
                  style: GoogleFonts.lato(
                      //'lato' is one of the many font families present in google fonts
                      color: const Color.fromARGB(255, 201, 153, 251),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center, //to make the text centered
                ),
                const SizedBox(height: 30),
                ...currentQuestion
                    .getShuffledList() //gives a shuffled list of String(answer) type
                    .map((answer) => AnswerButton(answer, (){
                      nextQuestion(answer);
                    })
                )
                //you can convert a string into a widget(AnswerButton) in dart.
              ]),
        ),
      ),
    );
  }
}
