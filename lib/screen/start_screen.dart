import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'images/lighthouse.jpg',
          //     width: 300,
          //   ),
          // ),
          Image.asset(
            'images/lighthouse.jpg',
            width: 300,
            color: const Color.fromARGB(200, 255, 255, 255),
          ),
          const SizedBox(height: 60),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(
              color: Color.fromARGB(255, 238, 223, 252),
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 60),
          OutlinedButton.icon(
            onPressed: startQuiz,
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
