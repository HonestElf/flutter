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
    },
  );
}
