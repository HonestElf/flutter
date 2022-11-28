import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:testing/views/login_view.dart';

void main() {
  group('Login view tests', () {
    testWidgets("login form fields exist", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: LoginView(),
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
      ));

      final fieldFinderEmail = find.byKey(const Key('fieldEmail'));
      final fieldFinderPhone = find.byKey(const Key('fieldPhone'));
      final fieldFinderSubmit = find.text('Отправить');

      expect(fieldFinderEmail, findsOneWidget);
      expect(fieldFinderPhone, findsOneWidget);
      expect(fieldFinderSubmit, findsOneWidget);

      expect(find.text(''), findsWidgets);
    });

    testWidgets("login form fields validation", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: LoginView(),
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
      ));

      final fieldFinderEmail = find.byKey(const Key('fieldEmail'));
      final fieldFinderPhone = find.byKey(const Key('fieldPhone'));
      final fieldFinderSubmit = find.text('Отправить');

      await tester.enterText(fieldFinderEmail, 'wrongEmail.ru');
      await tester.enterText(fieldFinderPhone, 'wrongPhone');
      expect(find.text('wrongPhone'), findsNothing);

      await tester.tap(fieldFinderSubmit);

      expect(find.text('Добро пожаловать'), findsNothing);
    });
    testWidgets("login form correct fields", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: LoginView(),
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
      ));

      final fieldFinderEmail = find.byKey(const Key('fieldEmail'));
      final fieldFinderPhone = find.byKey(const Key('fieldPhone'));
      final fieldFinderSubmit = find.text('Отправить');

      await tester.enterText(fieldFinderEmail, 'correct@email.ru');
      await tester.enterText(fieldFinderPhone, '23423424242');

      expect(find.text('correct@email.ru'), findsOneWidget);
      expect(find.text('23423424242'), findsOneWidget);

      await tester.tap(fieldFinderSubmit);

      await tester.pump();

      expect(find.text('Добро пожаловать'), findsOneWidget);
    });
  });

  group(
    'Register from fields exist',
    () {
      testWidgets("Register form fields exist", (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(
          home: LoginView(),
          localizationsDelegates: [
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
          ],
        ));
        final switchButton = find.byKey(const Key('SwitchButton'));

        await tester.tap(switchButton);

        await tester.pump();
        final fieldFinderName = find.byKey(const Key('fieldName'));
        final fieldFinderLastname = find.byKey(const Key('fieldLastName'));
        final fieldFinderEmail = find.byKey(const Key('fieldEmail'));
        final fieldFinderPhone = find.byKey(const Key('fieldPhone'));
        final fieldFinderSubmit = find.text('Отправить');

        expect(fieldFinderEmail, findsOneWidget);
        expect(fieldFinderPhone, findsOneWidget);
        expect(fieldFinderSubmit, findsOneWidget);
        expect(fieldFinderName, findsOneWidget);
        expect(fieldFinderLastname, findsOneWidget);

        expect(find.text(''), findsWidgets);
      });

      testWidgets("Register form fields validation",
          (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(
          home: LoginView(),
          localizationsDelegates: [
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
          ],
        ));
        final switchButton = find.byKey(const Key('SwitchButton'));

        await tester.tap(switchButton);

        await tester.pump();

        final fieldFinderEmail = find.byKey(const Key('fieldEmail'));
        final fieldFinderPhone = find.byKey(const Key('fieldPhone'));
        final fieldFinderSubmit = find.text('Отправить');

        await tester.enterText(fieldFinderEmail, 'wrongEmail.ru');
        await tester.enterText(fieldFinderPhone, 'wrongPhone');
        expect(find.text('wrongPhone'), findsNothing);

        await tester.tap(fieldFinderSubmit);

        expect(find.text('Добро пожаловать'), findsNothing);
      });

      testWidgets("Register form correct fields", (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(
          home: LoginView(),
          localizationsDelegates: [
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
          ],
        ));
        final switchButton = find.byKey(const Key('SwitchButton'));

        await tester.tap(switchButton);

        await tester.pump();
        final fieldFinderName = find.byKey(const Key('fieldName'));
        final fieldFinderLastname = find.byKey(const Key('fieldLastName'));
        final fieldFinderEmail = find.byKey(const Key('fieldEmail'));
        final fieldFinderPhone = find.byKey(const Key('fieldPhone'));
        final fieldFinderSubmit = find.text('Отправить');

        await tester.enterText(fieldFinderName, 'Petr');
        await tester.enterText(fieldFinderLastname, 'Ivanov');
        await tester.enterText(fieldFinderEmail, 'correct@email.ru');
        await tester.enterText(fieldFinderPhone, '23423424242');

        expect(find.text('Petr'), findsOneWidget);
        expect(find.text('Ivanov'), findsOneWidget);
        expect(find.text('correct@email.ru'), findsOneWidget);
        expect(find.text('23423424242'), findsOneWidget);

        await tester.tap(fieldFinderSubmit);

        await tester.pump();

        expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);
      });
    },
  );
}
