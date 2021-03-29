import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserCoupons extends StatelessWidget {
  final List list;
  UserCoupons({this.list});

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width*0.8;
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            new Container(
              child: Container(
                color: Color.fromRGBO(206, 206, 206, 1),
                child: new Card(
                  margin: const EdgeInsets.fromLTRB(0,0.5,0,0),
                  child: Column(
                     children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,10,10,5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(5,2,0,0),
                              child: Text(
                                list[i][1].toString(),
                                style: GoogleFonts.roboto(
                                  fontSize: 20.0,
                                  color: Color.fromRGBO(30, 30, 30, 1),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              alignment: Alignment.bottomRight,
                              child:Text(
                                list[i][3].toString() + "€",
                                style: GoogleFonts.roboto(
                                  fontSize: 20.0, color: Color.fromRGBO(60, 60, 60, 1),fontWeight: FontWeight.w700,),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16,0,5,8),
                        child: Row(
                          children: [
                            Container(
                              width:c_width,
                              child: Text(
                                ""+list[i][2].toString(),
                                style: GoogleFonts.roboto(
                                  fontSize: 15.0,
                                  color: Color.fromRGBO(60, 60, 60, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                       Padding(
                         padding: const EdgeInsets.fromLTRB(16,0,5,5),
                         child: Row(
                           children: [
                             Container(
                               width:c_width,
                               child: Text(
                                 "Vous avez un bon d'achat de "+list[i][4].toString()+"% sur cette article ",
                                 style: GoogleFonts.roboto(
                                     fontSize: 15.0,
                                     color: Color.fromRGBO(233, 65, 82, 1),
                                     fontWeight: FontWeight.w600
                                 ),
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
