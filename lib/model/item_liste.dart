import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

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
                height: 120,
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
                                list[i]['type'].toString(),
                                style: GoogleFonts.roboto(
                                    fontSize: 20.0,
                                    color: Color.fromRGBO(30, 30, 30, 1),
                                    fontWeight: FontWeight.w600,
                                    ),
                                ),
                              ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10,7.5,5,5),
                              margin: const EdgeInsets.only(left: 0.0),
                              child: Text(
                                list[i]['prix'].toString() +" €",
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
                                 ""+list[i]['description'].toString(),
                                style: GoogleFonts.roboto(
                                    fontSize: 14.5,
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
                              child: Text(
                                "Obtenez une reduction de "+list[i]['prix_pourcentage_reduction'].toString()+"% avec un code promo",
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
