

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/api/api_product.dart';
import '../api/api_qr_code.dart';
import 'template/drawer.dart';
import 'template/item_liste.dart';


class Home extends StatefulWidget{
  static const routeName = "/home";
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
      key: Key("Scaffold"),
      appBar: AppBar(
        key: Key("drawerBar"),
        title: Tooltip(message: "Open navigation menu", child: Text('GoStyle')),
        backgroundColor: Color.fromRGBO(233, 65, 82, 1),
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
      //bottomNavigationBar: Footer(),
    );
  }
}
