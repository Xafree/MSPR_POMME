import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';

class ApiQrCode {

  static final urlAddOneCoupon = 'http://192.168.42.138:8080/clientspace/coupon';
  static final urlGetOneCoupon = 'http://192.168.42.138:8080/couponresponse/';

  ApiQrCode();


  Future<http.Response> addUserCoupon(String email, String dateRef ) async {
    Map data = {
      "client_space": {"login_mail": "$email"},
      "coupon_is_consulted": {"stringDateRef": "$dateRef"}
    };
    var body = json.encode(data);
    var response = await http.post(urlAddOneCoupon,headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

  Future<List> getCodePromos(String code) async {
    var res = await http.get(urlGetOneCoupon + code);
    print('Response status: ${res.statusCode}');
    print('Response body: ${res.body}');
    return json.decode(res.body);
  }

}
