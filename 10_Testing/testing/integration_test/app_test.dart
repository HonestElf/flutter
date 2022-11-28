import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:testing/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    'Login integration test',
    () {
      testWidgets(
        'Submit empty form, nothing happend',
        (widgetTester) async {
          await widgetTester.pumpWidget(const MyApp());

          final fieldFinderSubmit = find.text('Отправить');

          expect(find.text(''), findsWidgets);

          await widgetTester.tap(fieldFinderSubmit);
          expect(find.text('Добро пожаловать'), findsNothing);
        },
      );

      testWidgets(
        'Switch forms',
        (widgetTester) async {
          await widgetTester.pumpWidget(const MyApp());

          expect(find.text('Вход'), findsWidgets);

          final switchButton = find.byKey(const Key('SwitchButton'));

          await widgetTester.tap(switchButton);

          await widgetTester.pump();
          expect(find.text('Регистрация'), findsWidgets);

          await widgetTester.tap(switchButton);

          await widgetTester.pump();
          expect(find.text('Вход'), findsWidgets);
        },
      );

      testWidgets(
        'Correct login enter',
        (widgetTester) async {
          await widgetTester.pumpWidget(const MyApp());

          final fieldFinderEmail = find.byKey(const Key('fieldEmail'));
          final fieldFinderPhone = find.byKey(const Key('fieldPhone'));
          final fieldFinderSubmit = find.text('Отправить');

          await widgetTester.enterText(fieldFinderEmail, 'correct@email.ru');
          await widgetTester.enterText(fieldFinderPhone, '23423424242');

          expect(find.text('correct@email.ru'), findsOneWidget);
          expect(find.text('23423424242'), findsOneWidget);

          await widgetTester.tap(fieldFinderSubmit);

          await widgetTester.pump();

          expect(find.text('Добро пожаловать'), findsOneWidget);
        },
      );

      testWidgets(
        'Correct register enter',
        (widgetTester) async {
          await widgetTester.pumpWidget(const MyApp());
          final switchButton = find.byKey(const Key('SwitchButton'));

          expect(switchButton, findsOneWidget);

          await widgetTester.tap(switchButton);

          await widgetTester.pump();
          final fieldFinderName = find.byKey(const Key('fieldName'));
          final fieldFinderLastname = find.byKey(const Key('fieldLastName'));
          final fieldFinderEmail = find.byKey(const Key('fieldEmail'));
          final fieldFinderPhone = find.byKey(const Key('fieldPhone'));
          final fieldFinderSubmit = find.text('Отправить');

          await widgetTester.enterText(fieldFinderName, 'Petr');
          await widgetTester.enterText(fieldFinderLastname, 'Ivanov');
          await widgetTester.enterText(fieldFinderEmail, 'correct@email.ru');
          await widgetTester.enterText(fieldFinderPhone, '23423424242');

          expect(find.text('Petr'), findsOneWidget);
          expect(find.text('Ivanov'), findsOneWidget);
          expect(find.text('correct@email.ru'), findsOneWidget);
          expect(find.text('23423424242'), findsOneWidget);

          await widgetTester.tap(fieldFinderSubmit);

          await widgetTester.pump();

          expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);
        },
      );
    },
  );
}
