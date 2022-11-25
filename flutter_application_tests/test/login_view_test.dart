import 'package:flutter/material.dart';
import 'package:flutter_application_tests/login_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Login view tests',
    (widgetTester) async {
      await widgetTester.pumpWidget(const MaterialApp(
        home: LoginView(),
      ));

      expect(find.byKey(const Key('fieldEmail')), findsOneWidget);
      expect(find.byKey(const Key('fieldPhone')), findsOneWidget);
      expect(find.text('Submit'), findsOneWidget);
      expect(find.text('Вы успешно зарегистрировались'), findsNothing);

      await widgetTester.enterText(
          find.byKey(const Key('fieldEmail')), 'test@test.com');

      expect(find.text('test@test.com'), findsOneWidget);

      await widgetTester.enterText(
          find.byKey(const Key('fieldPhone')), 'testText');

      expect(find.text('testText'), findsNothing);

      await widgetTester.enterText(
          find.byKey(const Key('fieldPhone')), '42342424244342');

      expect(find.text('42342424244342'), findsOneWidget);

      await widgetTester.tap(find.text('Submit'));
      await widgetTester.pump();
      expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);
    },
  );
}
