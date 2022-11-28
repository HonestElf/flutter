import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Login test',
    () {
      FlutterDriver? driver;

      setUpAll(
        () async {
          driver = await FlutterDriver.connect();
        },
      );

      tearDownAll(
        () {
          if (driver != null) {
            driver?.close();
          }
        },
      );

      final fieldFinderEmail = find.byValueKey('fieldEmail');
      final fieldFinderPhone = find.byValueKey('fieldPhone');
      final fieldFinderSubmit = find.text('Submit');

      test(
        'Test email field',
        () async {
          await driver?.tap(fieldFinderEmail);
          await driver?.waitFor(find.text(''));
          await driver?.enterText('test@test.com');
          await driver?.waitFor(find.text('test@test.com'));
        },
      );

      test(
        'Test phone field',
        () async {
          await driver?.tap(fieldFinderPhone);
          await driver?.waitFor(find.text(''));
          await driver?.enterText('23424234234242');
          await driver?.waitFor(find.text('23424234234242'));
        },
      );

      test(
        'Test submit',
        () async {
          await driver?.tap(fieldFinderSubmit);
        },
      );

      test(
        'Success text',
        () async {
          final success = find.text('Вы успешно зарегистрировались');
          expect(
              await driver?.getText(success), 'Вы успешно зарегистрировались');
        },
      );
    },
  );
}
