import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(234, 255, 60, 0),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          'Formula 1 Quizz',
          style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          label: const Text('Start'),
          icon: const Icon(Icons.arrow_forward),
        )
      ],
    );
  }
}
