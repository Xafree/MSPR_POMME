import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/api/api_qr_code.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CouponItem extends StatelessWidget {
  final List list;
  CouponItem({this.list});

  dynamic email = FlutterSession().get("email");
  ApiQrCode qrController = new ApiQrCode();

  String getEmail(Future<dynamic> email){
    return FlutterSession().get("$email").toString();
  }

  void AddCoupon(String email, String dateRef){
    qrController.addUserCoupon(email,dateRef);
  }

  void showToastMessage(String message){
    Fluttertoast.showToast(
        msg: message, //message to show toast
        toastLength: Toast.LENGTH_LONG, //duration for message to show
        gravity: ToastGravity.CENTER, //where you want to show, top, bottom
        //backgroundColor: Colors.red, //background Color for message
        textColor: Colors.white, //message text color
        fontSize: 16.0 //message font size
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            new Container(
              child: Container(
                //color: Colors.black,
                height: 150.3,
                child: new Card(
                  color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // add this
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                list[i]['type'].toString(),
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.black87),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                list[i]['description'].toString(),
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.black87),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              alignment: Alignment.bottomRight,
                              child: Row(
                                children: [
                                  Text(
                                    list[i]['prix'].toString() + "€",
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.black87),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            FutureBuilder(
                future : FlutterSession().get("email") ,
                builder: (context, snapshot){
                  email = snapshot.data;
              return Text(" ");
            }),
            new RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () =>{
                this.AddCoupon(email, list[i]['stringDateRef']),
                this.showToastMessage("Vous vennez d'ajouté un coupon"),
              },
              child: new Text("Ajouter le coupon"),
            ),
          ],
        );
      },
    );
  }
}