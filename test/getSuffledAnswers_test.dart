import 'package:test/test.dart';
import 'package:quizz_app/data/questions.dart';

void main() {
  test('getSuffledAnswers debe devolver una lista mezclada de las respuestas', () {
    questions.forEach((question) {
      final shuffledAnswers = question.getSuffledAnswers();
      expect(shuffledAnswers.length, equals(question.answers.length));
      shuffledAnswers.forEach((answer) {
        expect(question.answers, contains(answer));
      });
    });
  });
}