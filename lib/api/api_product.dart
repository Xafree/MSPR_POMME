import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../view/scan.dart';

class ApiProduct {
  static final urlPostOneProduct = 'http://192.168.1.11:8080/product';
  static final urlGetAllProduct ='http://192.168.42.138:8080/couponresponse/ville/toulon';

  ApiProduct();

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

  Future<List> getAllProductHtpp() async {
    var response = await http.get(urlGetAllProduct);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return json.decode(response.body);
  }
}
