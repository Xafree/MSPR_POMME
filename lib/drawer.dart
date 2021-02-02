import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawernavBarre extends StatelessWidget{

  DrawernavBarre();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: const <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('EPSI',
            style: TextStyle(
              color: Colors.white,fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Profile'),
        ),
        ListTile(
          leading: Icon(Icons.qr_code),
          title: Text('QR Ccode'),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('setting'),
        ),
      ],
    );
  }


}