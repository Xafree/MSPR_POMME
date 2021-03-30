import 'dart:io';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('All app', () {

    final login = find.byValueKey('user_email');
    final passWord = find.byValueKey('pass_word');
    final logButton = find.byValueKey('log_button');
    final scafoldNBarre = find.byTooltip('Open navigation menu');

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

        await driver.getText(find.text('GoStyle'));
    });

    test('drawer', () async {
      final openDrawer = find.byValueKey('Scaffold');
      await driver.waitFor(openDrawer);
      await driver.scroll(openDrawer,-300, 0, Duration(milliseconds: 500));
      print('clicked on drawer');
      await driver.getText(find.text('Menu'));
      sleep(Duration(seconds: 5));
    });

    test('go to scan page', () async {
      await driver.tap(find.byValueKey('qr_code'));
      await driver.tap(find.text('Scan coupon'));
      sleep(Duration(seconds: 5));
      // await driver.waitFor(find.byValueKey('ButtonScan'));
      // sleep(Duration(seconds: 5));
    });

    test('go to MesCoupons', () async {
      final openDrawer = find.byValueKey('drawerBar');
      await driver.waitFor(openDrawer);
      await driver.scroll(openDrawer,-600, 0, Duration(milliseconds: 500));
      await driver.getText(find.text('Menu'));
      print('clicked on drawer');
      sleep(Duration(seconds: 2));
      await driver.tap(find.byValueKey('Mes coupons'));
      sleep(Duration(seconds: 5));
    });

    test('to go deconnection', () async {
      final openDrawer = find.byValueKey('drawerBar');
      //await driver.waitFor(openDrawer);
      await driver.scroll(openDrawer,600, 0, Duration(milliseconds: 500));
      print('clicked on drawer');
      await driver.getText(find.text('Menu'));
      sleep(Duration(seconds: 2));
      await driver.tap(find.byValueKey('deconnexion page'));
      //sleep(Duration(seconds: 5));
    });
  });
}