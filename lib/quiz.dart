import 'package:flutter/material.dart';
import 'package:simple_quiz_app/data/questions.dart';
import 'package:simple_quiz_app/questions_screen.dart';
import 'package:simple_quiz_app/results_screen.dart';
import 'package:simple_quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];
  void switchActiveScreens() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String value) {
    selectedAnswers.add(value);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 78, 13, 151),
                const Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),

          child: activeScreen == 'start-screen'
              ? StartScreen(switchActiveScreens)
              : activeScreen == 'questions-screen'
              ? QuestionsScreen(onSelectAnswer: chooseAnswer)
              : ResultsScreen(selectedAnswers: selectedAnswers),
        ),
      ),
    );
  }
}
