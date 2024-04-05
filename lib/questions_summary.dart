import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/question_identifier.dart';

class QuestionsSummary extends StatelessWidget{
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String,Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox( //sizedbox is used to wrap the child widget and not to give space like we usually do. It'll restrict the space taken by Column widget
      height: 300,
      width: 300,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map((data) => //not using spreading cuz children is expecting a list
            Row(children: [ //a row will be created for each element of list
              QuestionIdentifier(
                  questionIndex: data['question_index'] as int,
                  isCorrectAnswer: data['user_answer'] == data['correct_answer']
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded( //Expanded widget: Children of Row will get filled along Row's Main axis.
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, //to align all the text to left
                  children: [
                  Text(
                      data['question'].toString(),
                    style: GoogleFonts.lato(
                      color: const Color.fromARGB(255, 255,255, 255),
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(data['user_answer'].toString(),
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(224, 0, 231, 217)),
                  ),
                  Text(
                    data['correct_answer'].toString(),
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(224, 179, 231, 217)
                  ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                  ],)
              )
            ],)
            ).toList() //'children' accepts 'List', but 'map' returns 'Iterable' type
        ),
      ),
    );
  }
}