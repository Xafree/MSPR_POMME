import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/api/api_qr_code.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class CouponItem extends StatelessWidget {
  final List list;
  CouponItem({this.list});

  dynamic email;
  ApiQrCode qrController = new ApiQrCode();


 AddCoupon(String email, String dateRef){
    var res = qrController.addUserCoupon(email,dateRef);
    if(res == 200){
      this.showToastMessage("Vous venez d'ajouter un coupon");
    }else{
      this.showToastMessage("Ce coupon existe déjà dans votre espace");
    }
  }

  void showToastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        textColor: Colors.white,
        fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width*0.8;
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            new Container(
              child: Container(
                color: Color.fromRGBO(206, 206, 206, 1),
                child: new Card(
                  margin: const EdgeInsets.fromLTRB(0,0.5,0,0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,10,10,5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(5,2,0,0),
                              child: Text(
                                list[i]['type'].toString(),
                                style: GoogleFonts.roboto(
                                  fontSize: 20.0,
                                  color: Color.fromRGBO(30, 30, 30, 1),
                                  fontWeight: FontWeight.w600,
                                ),
                            ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10,7.5,5,5),
                              margin: const EdgeInsets.only(left: 0.0),
                              child: Row(
                                children: [
                                  Text(
                                    list[i]['prix'].toString() + " €",
                                    style: GoogleFonts.roboto(
                                      fontSize: 20.0, color: Color.fromRGBO(60, 60, 60, 1),fontWeight: FontWeight.w700,),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16,0,5,8),
                        child: Row(
                          children: [
                            Container(
                              width:c_width,
                              child: Text(
                                list[i]['description'].toString(),
                                style: GoogleFonts.roboto(
                                  fontSize: 15.0,
                                  color: Color.fromRGBO(60, 60, 60, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16,0,5,5),
                        child: Row(
                          children: [
                            Container(
                              width : c_width,
                              child: Text(
                                "Bon d'achat de "+list[i]['prix_pourcentage_reduction'].toString()+"% sur cette article",
                                style:GoogleFonts.roboto(
                                    fontSize: 15.0,
                                    color: Color.fromRGBO(233, 65, 82, 1),
                                    fontWeight: FontWeight.w600
                                ),
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
            // ignore: deprecated_member_use
            new RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Color.fromRGBO(233, 65, 82, 1),
              onPressed: () async =>{
                print(email),
                this.AddCoupon(email, list[i]['stringDateRef']),
              },
              child: new Text("Ajouter le coupon"),
            ),
          ],
        );
      },
    );
  }
}
