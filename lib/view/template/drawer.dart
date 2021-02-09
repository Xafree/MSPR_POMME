import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/emman/Desktop/cour%20EPSI/MSPR/MSPR_POMME/lib/view/scan.dart';

class DrawernavBarre extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child:ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
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
              onTap: () {
                Navigator.of(context).pushNamed(ScanPage.routeName);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('setting'),
            ),
          ],
        ),
    );
    }


}
