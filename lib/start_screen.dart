import 'package:flutter/material.dart';
import 'quiz.dart';
class StartScreen extends StatelessWidget {
  // const StartScreen(void Function() startQuiz, {super.key}); // Way 1: StartScreen constructor will take a function (which doesn't take arguments) in argument. But //startQuiz function can't be executed in build() directly, so we creating this variable
  const StartScreen(this.startQuiz, {super.key}); //Way 2
  final void Function() startQuiz; //specify Function() explicitly

  @override
  Widget build(context) {
    return Center(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [const SizedBox(
              height: 50),
            Image.asset('assets/images/quiz-logo.png', width: 200, height: 200,
            color: const Color.fromARGB(150, 255, 255, 255),
            ),
            const SizedBox(height: 50),
            const Text (
                'Learn Flutter the fun way!',
                style: TextStyle(fontSize: 25, color: Colors.white)),
            const SizedBox(height: 50),
            OutlinedButton.icon(
                onPressed: startQuiz,
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 15)),
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text('Start Quiz'))
          ]
      ),
    );
  }
}