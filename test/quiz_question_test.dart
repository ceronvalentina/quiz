import 'package:test/test.dart';
import 'package:quizz_app/models/quiz_question.dart';
import 'package:quizz_app/data/questions.dart';

void main() {
  group('Quiz Question Tests', () {
    test('Preguntas deben ser una lista no vacía de QuizQuestion', () {
      expect(questions, isNotEmpty);
      questions.forEach((question) {
        expect(question, isA<QuizQuestion>());
      });
    });
  });
}