import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_url.dart';

class ApiQrCode {

  ApiQrCode();

  Future<int> addUserCoupon(String email, String dateRef ) async {
    Map data = {
      "client_space": {"login_mail": "$email"},
      "coupon_is_consulted": {"stringDateRef": "$dateRef"}
    };
    var body = json.encode(data);
    var response = await http.post(ApiURL.urlAddOneCoupon,headers: {"Content-Type": "application/json"}, body: body);
    return response.statusCode;
  }

  Future<List> getCodePromos(String code) async {
    var res = await http.get(ApiURL.urlGetOneCoupon + code);
    return json.decode(res.body);
  }
}
