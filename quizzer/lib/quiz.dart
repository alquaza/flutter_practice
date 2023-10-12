import 'package:flutter/material.dart';
import 'package:quizzer/start_screen.dart';
import 'package:quizzer/questions_screen.dart';
import 'package:quizzer/data/questions.dart';
import 'package:quizzer/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  @override
  void initState() {
    // want to add this method to state classes to do some extra intialization work, executed once as object being created (but before build)
    // a third method (dispose) is called right before a widget is deleted
    super.initState();
    activeScreen = StartScreen(
        switchScreen); // pass switchScreen as an argument so StartScreen can use it
  }

  void switchScreen() {
    // setState is available in classes that extend state, whenever setState is called it makes changes then runs the build method again
    // (updating ui to show changes)
    setState(() {
      activeScreen = QuestionsScreen(chooseAnswer);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(selectedAnswers);
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.deepPurple, Colors.blueGrey],
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
