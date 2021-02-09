import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'file:///C:/Users/emman/Desktop/cour%20EPSI/MSPR/MSPR_POMME/lib/view/scan.dart';

class ApiQrCode {

  static final urlPostOneProduct = 'http://192.168.1.11:8080/product';
  static final urlGetOneProduct = 'http://192.168.1.11:8080/product/';
  HttpClientResponse client;
  ApiQrCode() {}

  Future<http.Response> addDataProduct(int codeController,context) async {

    Map data = { // A modifier quand le service sera good
      "typeProduit": "Chemise",
      "description": "Chemise coupe slim, diponible de M à XXL",
      "codeProduit": codeController
    };
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.post(urlPostOneProduct,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    Navigator.of(context).pushNamed(ScanPage.routeName);
    return response;
  }

  Future<http.Response> getCodePromos(String code) async {
    var res = await http.get(urlGetOneProduct + code);
    print("${res.statusCode}");
    print("${res.body}");
    return res;
  }
}