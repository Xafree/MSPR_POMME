import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/home.dart';
import 'package:flutter_app/view/scan.dart';
import '../coupons.dart';
import '../login_page.dart';

class DrawernavBarre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: Key('openDrawer'),
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
            title: Text('Accueil'),
            onTap: () {
              Navigator.of(context).pushNamed(Home.routeName);
            },
          ),
          ListTile(
            key: Key("qr_code"),
            leading: Icon(Icons.qr_code),
            title: Text('QR Ccode'),
            onTap: () {
              Navigator.of(context).pushNamed(ScanPage.routeName);
            },
          ),
          ListTile(
            key: Key("Mes coupons"),
            leading: Icon(Icons.settings),
            title: Tooltip(message: "goToMesCoupons", child: Text('Mes Coupons')),
            onTap: () {
              Navigator.of(context).pushNamed(Coupons.routeName);
            },
          ),
          ListTile(
            key: Key("deconnexion"),
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
