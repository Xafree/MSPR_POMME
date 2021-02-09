import 'package:flutter/material.dart';
import 'view/home.dart';
import 'view/scan.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POMME',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //initialRoute: '/',
      routes: {
        '/' : (_)=> Home(),
        ScanPage.routeName : (_) => ScanPage(),
      },
    );
  }
}

