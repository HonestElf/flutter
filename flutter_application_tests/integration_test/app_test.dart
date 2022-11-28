import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// import 'package:flutter_application_tests/main.dart' as app;
import 'package:flutter_application_tests/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final fieldFinderEmail = find.byKey(const Key('fieldEmail'));
  final fieldFinderPhone = find.byKey(const Key('fieldPhone'));
  final fieldFinderSubmit = find.text('Submit');
  group(
    'Integration login test',
    () {
      testWidgets(
        'Test email field',
        (widgetTester) async {
          await widgetTester.pumpWidget(const MyApp());

          expect(fieldFinderEmail, findsOneWidget);
          expect(find.text(''), findsWidgets);

          await widgetTester.enterText(fieldFinderEmail, 'test@test.com');
          expect(find.text('test@test.com'), findsOneWidget);

          await widgetTester.enterText(fieldFinderPhone, '23424234234242');
          expect(find.text('23424234234242'), findsOneWidget);

          await widgetTester.tap(fieldFinderSubmit);

          await widgetTester.pumpAndSettle();

          expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);
        },
      );
      testWidgets(
        'Test submit process field',
        (widgetTester) async {
          await widgetTester.pumpWidget(const MyApp());

          expect(fieldFinderEmail, findsOneWidget);
          expect(find.text(''), findsWidgets);

          await widgetTester.enterText(fieldFinderEmail, 'test@test.com');
          expect(find.text('test@test.com'), findsOneWidget);

          await widgetTester.enterText(fieldFinderPhone, '23424234234242');
          expect(find.text('23424234234242'), findsOneWidget);

          await widgetTester.tap(fieldFinderSubmit);

          await widgetTester.pumpAndSettle();

          expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);
        },
      );
    },
  );
}
