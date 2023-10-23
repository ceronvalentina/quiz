import 'package:test/test.dart';
import 'package:quizz_app/data/questions.dart';

void main() {
  test('La pregunta de cada QuizQuestion debe ser una cadena no vacía', () {
    questions.forEach((question) {
      expect(question.questions, isNotEmpty);
      expect(question.questions, isA<String>());
    });
  });
}