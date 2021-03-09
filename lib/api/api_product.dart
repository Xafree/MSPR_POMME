import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/coupons.dart';
import 'package:http/http.dart' as http;
import '../view/scan.dart';

class ApiProduct {

  static final urlPostOneProduct = 'http://192.168.1.11:8080/product';
  static final urlGetAllProduct ='http://192.168.42.138:8080/couponresponse/ville/toulon';
  static final urlGetCouponByMail ='http://192.168.0.13:8080/clientspace/coupons';

  ApiProduct();

  Future<List> getCoupons(String mail) async {
    Map data = {
      "client_space": {"login_mail": mail}
    };
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.post(urlGetCouponByMail,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");

    return json.decode(response.body);
  }

  Future<List> getAllProductHtpp() async {
    var response = await http.get(urlGetAllProduct);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return json.decode(response.body);
  }
}
