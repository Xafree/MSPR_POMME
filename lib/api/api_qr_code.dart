import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/view/scan.dart';
import 'package:http/http.dart' as http;

class ApiQrCode {
  static final urlPostOneProduct = 'http://192.168.1.11:8080/product';
  static final urlGetOneProduct = 'http://192.168.42.138:8080/couponresponse/';

  ApiQrCode();


  Future<http.Response> addDataProduct(int codeController, context) async {
    Map data = {
      // A modifier quand le service sera good
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

  Future<List> getCodePromos(String code) async {
    var res = await http.get(urlGetOneProduct + code);
    print('Response status: ${res.statusCode}');
    print('Response body: ${res.body}');
    return json.decode(res.body);
  }

}
