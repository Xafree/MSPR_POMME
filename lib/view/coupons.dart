import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/api/api_product.dart';
import 'package:flutter_app/view/template/user_couponslist.dart';
import 'package:flutter_session/flutter_session.dart';
import 'template/drawer.dart';


class Coupons extends StatefulWidget {
  static const routeName = "/mescoupons";
  @override
  State<StatefulWidget> createState() {
    return _CouponState();
  }
}

class _CouponState extends State<Coupons> {
  List data;
  ApiProduct productController = new ApiProduct();

  dynamic mail;
  Future<List> getCoupons(mail) async {
    return productController.getCoupons(mail);
  }

  void initState() {
    getmail();
    super.initState();
  }

  getmail() async {
    final mailsession = await FlutterSession().get("email");
    setState(() {
      mail = mailsession.toString() ?? 'default';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key : Key("drawerBar"),
        backgroundColor: Color.fromRGBO(233, 65, 82, 1),
        title: const Text('Mes coupons'),
      ),
      drawer: DrawernavBarre(),
      body: new FutureBuilder<List>(
        future: getCoupons(mail),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new UserCoupons(
                  list: snapshot.data
                )
              : new Center(
                  child: Text(
                    'Vous n\'avez pas encore de coupons enregistrés',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold)
                  )
                );
        },
      ),
    );
  }
}
