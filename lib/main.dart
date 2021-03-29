import 'package:flutter/material.dart';
import 'package:flutter_app/view/coupons.dart';
import 'package:flutter_app/view/login_page.dart';
import 'view/home.dart';
import 'view/scan.dart';



void main() {
  //enableFlutterDriverExtension();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'POMME',
      theme: ThemeData(primarySwatch: Colors.blue, visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //home: Login(),
        routes: {
        '/': (_) => Login(),
        '/home': (_) => Home(),
        '/mescoupons': (_) => Coupons(),
        ScanPage.routeName: (_) => ScanPage()
      },
    );
  }
}