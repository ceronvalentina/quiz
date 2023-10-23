import 'package:quizz_app/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter/material.dart';

void main() {
  List<String> questions = [
    'Pregunta 1',
    'Pregunta 2',
    // Agrega más preguntas según sea necesario
  ];

  testWidgets('startQuizTest', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    expect(find.text('Formula 1 Quizz'), findsOneWidget);
  });

  testWidgets('selectAnswerTest', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    expect(find.text('Answer: '), findsOneWidget);
  });

  testWidgets('restartQuizTest', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    expect(find.text('Formula 1 Quizz'), findsOneWidget);
  });

  testWidgets('navigateThroughQuizTest', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    for (int i = 0; i < questions.length; i++) {
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text('Answer: '), findsOneWidget);
    }
    expect(find.text('You answered '), findsOneWidget);
    expect(find.text(' out of '), findsOneWidget);
    expect(find.text(' questions correctly!'), findsOneWidget);
  });
}
