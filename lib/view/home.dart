
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/api/api_product.dart';
import '../api/api_qr_code.dart';
import 'template/drawer.dart';
import 'template/footer.dart';
import '../model/item_liste.dart';


class Home extends StatefulWidget{
  static const routeName = "/";
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}


class _HomeState extends State<Home>{
  List data;
  ApiQrCode controller = new ApiQrCode();
  ApiProduct productController = new ApiProduct();

  Future<List> getData() async {
    return productController.getAllProductHtpp();
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POMME'),
      ),
      drawer: DrawernavBarre(),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
            list: snapshot.data,
          )
              : new Center(
            child: new CircularProgressIndicator(),
          );
        },

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
