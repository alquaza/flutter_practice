import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (datum) {
              return Row(children: [
                Text(((datum['question_index'] as int) + 1).toString()),
                Expanded(
                  child: Column(
                    children: [
                      Text(datum['question'] as String),
                      const SizedBox(height: 5),
                      Text(datum['user_answer'] as String),
                      Text(datum['correct_answer'] as String),
                    ],
                  ),
                ),
              ]);
            },
          ).toList(),
        ),
      ),
    );
  }
}
