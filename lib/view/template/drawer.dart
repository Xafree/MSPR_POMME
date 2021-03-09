import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/scan.dart';
import '../coupons.dart';
import '../login_page.dart';

class DrawernavBarre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'EPSI',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
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
            title: Text('mes coupons'),
            onTap: () {
              Navigator.of(context).pushNamed(Coupons.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Deconnexion'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
          ),
        ],
      ),
    );
  }
}
