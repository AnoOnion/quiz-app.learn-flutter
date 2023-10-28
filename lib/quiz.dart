import 'package:flutter/material.dart';

import 'package:quiz_app/data/question_data.dart';
import 'package:quiz_app/screen/results_screen.dart';
import 'package:quiz_app/screen/start_screen.dart';
import 'package:quiz_app/screen/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  List<String> _selectedAnswers = [];
  var activeScreen = 'start-screen';

  // @override
  // void initState() {
  //   super.initState();
  //   activeScreen = StartScreen(switchScreen);
  // }

  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionsScreen();
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chooseAnswers: _selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 12, 150),
                Color.fromARGB(255, 106, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
