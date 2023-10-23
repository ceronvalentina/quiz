import 'package:flutter/material.dart';

import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/widgets/questions_screen.dart';
import 'package:quizz_app/widgets/home_entry.dart';
import 'package:quizz_app/widgets/results_screen.dart';

const List<Color> colors = [
  Color.fromARGB(255, 1, 30, 108),
  Color.fromARGB(255, 14, 40, 112),
];

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String? activeScreen;
  List<String> selectedAnwers = [];

  @override
  void initState() {
    super.initState();
    activeScreen = 'home-screen';
  }

  void startQuiz() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'home-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnwers.add(answer);

    if (selectedAnwers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = Home(startQuiz);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
          chosenAnswers: selectedAnwers, restartQuiz: restartQuiz);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: colors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
