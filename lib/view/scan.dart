import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/template/coupon_item.dart';
import 'package:flutter_app/view/template/drawer.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_app/api/api_qr_code.dart';
import 'package:google_fonts/google_fonts.dart';


class ScanPage extends StatefulWidget {
  static const routeName = "/view/ScanPage";
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {

  Future<String> item = new Future<String>(null);
  ApiQrCode qrController = new ApiQrCode();
  String qrCodeResult ;
  bool scanValeur = false;
  bool backCamera = true;

  _ScanPageState();

  Future<List> getQrCode(String code) async {
    return await qrController.getCodePromos(code);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          key : Key("drawerBar"),
          backgroundColor: Color.fromRGBO(233, 65, 82, 1),
          title: Text("Scan coupon"),
          actions: <Widget>[
            IconButton(
              key: Key("ButtonScan"),
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
        body:new FutureBuilder<List>(
          future: this.getQrCode(qrCodeResult),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? new CouponItem(
              list: snapshot.data,
            )
                : new Center(
                  child: Text("Scannez un QR code !",
                    style: GoogleFonts.roboto(
                      fontSize: 20.0,
                      color: Color.fromRGBO(30, 30, 30, 1),
                      fontWeight: FontWeight.w600,
                    ),),
            );
          },
        ),
    );
  }
}

int camera = -1;
