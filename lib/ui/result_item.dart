import 'package:flutter/material.dart';

class ResultItem extends StatelessWidget {
  const ResultItem(this.data, this.answerColor, {super.key});

  final Map<String, Object> data;
  final Color answerColor;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: answerColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            ((data['questions_idx'] as int) + 1).toString(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data['question'] as String,
                style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 10),
            Text(
              'Answer: ${data['user_answer'] as String}',
              style: const TextStyle(
                color: Colors.greenAccent,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Your answer: ${data['correct_answer'] as String}',
              style: TextStyle(
                  color: answerColor == Colors.greenAccent
                      ? Colors.greenAccent
                      : Colors.redAccent),
            ),
            const SizedBox(height: 20),
          ],
        ),
      )
    ]);
  }
}
