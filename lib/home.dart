import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'drawer.dart';
import 'footer.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }

}

class _HomeState extends State<Home>{

  int _score = 0 ;
  var _currenteUserName  = "";
  var _scoreMax = 0;
  var _isCounting = false;
  DrawernavBarre _drawer = new DrawernavBarre();
  Footer _footer = new Footer();

  void _plusOneScore(){
    setState(() {
      _score = _score+1;
    });
  }

  void _startCounting(){
    setState(() {
      _score = 0;
      _isCounting = true;
      Timer(Duration(seconds: 10),_stopGame);
    });
  }
  void _stopGame(){
    if(this._score > this._scoreMax){
      this._scoreMax = this._score+1;
    }
    _isCounting = false;
  }

  void _plusMinusScore() {
    setState(() {
      if(this._score > 0){
        _score = _score-1;
      }else{
        print("Votre score et null");
      }
    });
  }

  _currenteUserNameChange(String newUserName){
    setState(() {
      _currenteUserName = newUserName;
    });
  }



  void httpURL() async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url = 'https://www.googleapis.com/books/v1/volumes?q={http}';

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Epsi'),
      ),
      drawer: Drawer(
        child: _drawer.build(context),
      ),
      body:SafeArea(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if(_isCounting)
              TextField(autocorrect: false,onChanged: _currenteUserNameChange,),
            Text("Nombre de click : ${this._score}"),
            //Text("Le record est : ${this._scoreMax}"),
            if(_isCounting)
              IconButton(icon: Icon(Icons.plus_one),onPressed: httpURL,),
            Spacer(),
            if(_isCounting == false)
              ElevatedButton.icon(onPressed: _startCounting,label: Text("Ajouter au Score"),icon: Icon(Icons.plus_one)),
          ],
        ),
      ),
      bottomNavigationBar: _footer.build(context),
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