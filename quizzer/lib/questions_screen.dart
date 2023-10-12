import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzer/answer_button.dart';
import 'package:quizzer/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String onSelectAnswer) {
    // can use widget class to access properties in widget class from state class
    widget.onSelectAnswer(onSelectAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      // this sizedbox is so that it takes up the whole screen, but could have just wrapped it with a Center widget
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            // the ... "spreads" the list, which means that it takes the elements of the list and puts it in the parent list, in this case, children
            ...currentQuestion.getShuffledAnswers().map((answer) {
              // the map method performs the provided function on each element of the list
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  // need to use anonymous function to call other function, as it does not accept arguments otherwise
                  answerQuestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
