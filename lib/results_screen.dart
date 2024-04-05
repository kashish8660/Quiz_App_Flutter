import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/Data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:quiz_app/quiz.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers, required this.restartQuiz});
  final List<String> chosenAnswers;
  final void Function() restartQuiz;
  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];

    for(var i = 0; i< chosenAnswers.length; i++) {
      summary.add({ //below 4 lines become 1 map object and not 4 map objects. 1 element of a map can store multiple data about 1 question like ‘question_index’, ‘question’, ‘user_answer’, etc
        'question_index': i, //Key:Value pair
        'question': questions[i].text,
        'user_answer':chosenAnswers[i],
        'correct_answer':questions[i].answers[0]
      });
    }

    return summary;
  }
  @override
  Widget build(BuildContext context) {
    final summaryData= getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((element) => element['user_answer']==element['correct_answer']).length; //'where' is used to filter the list
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: const Color.fromARGB(255, 255, 255, 255)
                ),),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30,),
            TextButton.icon(
                onPressed: restartQuiz,
                icon: const Icon(Icons.refresh),
                label: const Text("Restart Quiz"))
          ],
        ),
      ),
    );
  }
}
