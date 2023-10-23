import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/widgets/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.restartQuiz});

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'questions_idx': i,
          'question': questions[i].questions,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numberOfTotalQuestions = questions.length;
    final numberCorrectQuestions = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).toList();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'You answered ${numberCorrectQuestions.length} out of $numberOfTotalQuestions questions correctly!',
          style: const TextStyle(color: Colors.white, fontSize: 22),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        QuestionsSummary(summaryData),
        const SizedBox(
          height: 20,
        ),
        FilledButton.icon(
          onPressed: restartQuiz,
          label: const Text('Restar F1 Quizz'),
          icon: const Icon(Icons.restart_alt_rounded),
        )
      ],
    );
  }
}
