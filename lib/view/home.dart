import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../api/api_qr_code.dart';
import 'template/drawer.dart';
import 'template/footer.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }

}

class _HomeState extends State<Home>{

  ApiQrCode controller = new ApiQrCode();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POMME'),
      ),
      drawer: DrawernavBarre(),
      body:SafeArea(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              IconButton(icon: Icon(Icons.plus_one), ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}

/**      appBar: AppBar(
    title: const Text("AppBar Test"),
    ),

    body: Column(
    children: [
    Text("Score : ${this._score}"),
    IconButton(icon: Icon(Icons.plus_one),iconSize: 50, onPressed: _plusOneScore),
    IconButton(icon: Icon(Icons.reset_tv), onPressed: _plusResetScore),
    ElevatedButton.icon(onPressed: _plusOneScore(),label: Text("Ajouter 1 au score"),icon: Icon(Icons.plus_one)),
    ],
    ) **/