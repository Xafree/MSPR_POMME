import 'dart:io';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_app/api/qrcodeController.dart';


class ScanPage extends StatefulWidget {
  static const routeName = "/view/ScanPage";
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {

  Qrcodecontroller qrController = new Qrcodecontroller();
  HttpClientResponse client;
  String qrCodeResult = "";
  Qrcodecontroller controllerQrCode = new Qrcodecontroller();

  bool backCamera = true;

  String PostqrCode(String code,context) {
    String mess = " ";
    if(code == null){
      mess = "Incorrecte QR code";
    }else{
      qrController.addDataProduct(int.parse(code),context);
      mess = "Qr code envoyé";
    }
    return mess;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scan using:" + (backCamera ? "Front Cam" : "Back Cam")),
          actions: <Widget>[
            IconButton(
              icon: backCamera
                  ? Icon(Ionicons.ios_camera_reverse)
                  : Icon(Icons.camera),
              onPressed: () {
                setState(() {
                  backCamera = !backCamera;
                  camera = backCamera ? 1 : -1;
                });
              },
            ),
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
                });
              },
            )
          ],
        ),
        body: Center(
          child: Text(
            (qrCodeResult == null) || (qrCodeResult == "")
                ? "Scanner un QR code"
                : PostqrCode(qrCodeResult,context),
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
          ),
        ));
  }
}

int camera = 1;
