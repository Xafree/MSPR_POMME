import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/dashboard.dart';
import 'package:flutter_app/view/home.dart';
import 'package:flutter_app/view/scan.dart';
import '../login_page.dart';

class DrawernavBarre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(233, 65, 82, 1),
            ),
            child:
            Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushNamed(Home.routeName);
            },
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
            title: Text('Mes coupons'),
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
