import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/home.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'api_url.dart';

class LoginRegisterApi {

  Future save(String mail, String passWord, context) async {
    var res = await http.post(ApiURL.urlLogin,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'login_mail': mail, 'password': passWord}));
    var session = FlutterSession();
    await session.set("email", mail);
    if (res.statusCode == 200) {
      await FlutterSession().set('email', mail);

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ));
    } else if (res.statusCode == 400) {
      Fluttertoast.showToast(
        msg: "Mot de passe incorrect",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    else if (res.statusCode == 404) {
      Fluttertoast.showToast(
        msg: "Vous n'êtes pas encore inscrit",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  Future saveRegister(String mail, String passWord, context) async {
    var res = await http.post(ApiURL.urlRegister,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'login_mail': mail, 'password': passWord}));
    if (res.body != null) {
      Navigator.pop(context);
    }
  }
}