import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserCoupons extends StatelessWidget {
  final List list;
  UserCoupons({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            new Container(
              child: Container(
                //color: Colors.black,
                height: 150.3,
                child: new Card(
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // add this
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                list[i][1].toString(),
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.black87),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                list[i][2].toString(),
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.black87),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              alignment: Alignment.bottomRight,
                              child: Row(
                                children: [
                                  Text(
                                    list[i][3].toString() + "€",
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.black87),
                                  ),
                                ],
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
          ],
        );
      },
    );
  }
}
