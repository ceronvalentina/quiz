import 'package:flutter/material.dart';
import 'package:quizz_app/ui/result_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: SizedBox(
          height: 480,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: summaryData.map((data) {
                if (data['correct_answer'] == data['user_answer']) {
                  return ResultItem(data, Colors.greenAccent);
                } else {
                  return ResultItem(data, Colors.redAccent);
                }
              }).toList(),
            ),
          ),
        ));
  }
}
