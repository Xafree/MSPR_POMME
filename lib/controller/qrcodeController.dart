import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/qr_code/scan.dart';
class Qrcodecontroller {

  static final urlOneProduct = 'http://192.168.1.11:8080/product';
  HttpClientResponse client;
  Qrcodecontroller() {}

  Future<http.Response> addDataProduct(int codeController,context) async {
    Map data = { // A modifier quand le service sera good
      "typeProduit": "Chemise",
      "description": "Chemise coupe slim, diponible de M à XXL",
      "codeProduit": codeController
    };
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.post(urlOneProduct,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    Navigator.of(context).pushNamed(ScanPage.routeName);
    return response;
  }

  Future<dynamic> getCodePormot(String code) async {
    var res = await http.get(urlOneProduct + "/" + code);
    print(res?.body);
    return res?.body;
  }

}
