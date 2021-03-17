import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {

  group('All app', () {

    final login = find.byValueKey('user_email');
    final passWord = find.byValueKey('pass_word');
    final logButton = find.byValueKey('log_button');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Login', () async {
      await driver.tap(login);
      await driver.enterText("mail3");
      await driver.tap(passWord);
      await driver.enterText("pass3");
      await driver.tap(logButton);
      sleep(Duration(seconds: 5));
      //await driver.waitFor(logButton);
      await driver.getText(find.text('GoStyle'));
    });


    test('Navbarre', () async {

      final mesCoupons = find.byTooltip('goToMesCoupons');
      await driver.tap(mesCoupons);
      expect(1, 1);
    });
  });
}