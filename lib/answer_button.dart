import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answer, this.nextQuestion, {super.key});
  final String answer;
  final void Function() nextQuestion;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: nextQuestion,
        style: ElevatedButton.styleFrom(),
        child: Text(answer, textAlign: TextAlign.center));
  }
}