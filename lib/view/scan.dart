import 'dart:io';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/template/drawer.dart';
import 'package:flutter_app/view/template/footer.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_app/api/api_qr_code.dart';


class ScanPage extends StatefulWidget {
  static const routeName = "/view/ScanPage";
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {

  ApiQrCode qrController = new ApiQrCode();
  String qrCodeResult = "";
  bool scanValeur = false;
  bool backCamera = true;

  PostqrCode(String code,context) {
      qrController.addDataProduct(int.parse(code),context);
  }

  getQrCode(String code) {
    qrController.getCodePromos(code);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("POMME"),
          actions: <Widget>[
            IconButton(
              icon: Icon(MaterialCommunityIcons.qrcode_scan),
              onPressed: () async {
                ScanResult codeSanner = await BarcodeScanner.scan(
                  options: ScanOptions(
                    useCamera: camera,
                  ),
                ); //barcode scanner
                setState(() {
                  qrCodeResult = codeSanner.rawContent;
                  (qrCodeResult == null && qrCodeResult == "")? scanValeur=false:scanValeur=true;
                });
              },
            ),
          ],
        ),
        drawer: DrawernavBarre(),
        body: Column(
          children: <Widget>[
            //if(!scanValeur){},
            Text((!scanValeur)?
            "Scanner un QR code !": "Le code promos est : "+qrCodeResult),
          RaisedButton(onPressed: () {
            getQrCode(qrCodeResult);
          },
              child: Text(
                  (!scanValeur)?
                  "Scanner un QR code !": "Envoyer le QR code"
                  , style: TextStyle(fontSize: 20) )
          ),
          ],
        ),
        bottomNavigationBar: Footer(),
    );


  }
}

int camera = -1;
/**
    Center(
    child: Text(
    (qrCodeResult == null) || (qrCodeResult == "")
    ? "Scanner un QR code"
    : "le code promos est" +qrCodeResult,
    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
    ),
    ));

*/