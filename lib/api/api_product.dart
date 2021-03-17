import 'dart:convert';

import 'package:http/http.dart' as http;
import 'api_url.dart';

class ApiProduct {
  ApiProduct();

  Future<List> getCoupons(String mail) async {
    Map data = {
      "client_space": {"login_mail": mail}
    };
    var body = json.encode(data);
    var response = await http.post(ApiURL.urlGetCouponByMail, headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");

    return json.decode(response.body);
  }

  Future<List> getAllProductHtpp() async {
    var response = await http.get(ApiURL.urlGetAllProduct);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return json.decode(response.body);
  }
}
