import 'package:flutter/material.dart';
import 'package:migrenuygulamasi/agriTetikleyici.dart';
import 'package:migrenuygulamasi/agriTipi.dart';
import 'package:migrenuygulamasi/agrininYeri.dart';
import 'package:migrenuygulamasi/hang%C4%B0lac.dart';
import 'package:migrenuygulamasi/saat_secim.dart';
import 'package:migrenuygulamasi/semptomlar.dart';

class basAgrisi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        title: Text("Başağrısı Günlüğüm"),
      ),
      body: Scrollbar(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: 340,
              height: 60,
              margin: EdgeInsets.only(left: 30, right: 20, top: 20),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Colors.grey[300],
                  child: Text(
                    "Ne Zaman Başladı?",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SaatSecim()));
                  }),
            ),
            Container(
              width: 340,
              height: 60,
              margin: EdgeInsets.only(left: 30, right: 20, top: 20),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Colors.grey[300],
                  child: Text(
                    "Ağrı Tipi",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AgriTipi()));
                  }),
            ),
            Container(
              width: 340,
              height: 60,
              margin: EdgeInsets.only(left: 33, right: 20, top: 20),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Colors.grey[300],
                  child: Text(
                    "Ağrınızı Ne Tetikledi",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AgriTetikleyici()));
                  }),
            ),
            Container(
              width: 340,
              height: 60,
              margin: EdgeInsets.only(left: 35, right: 20, top: 20),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Colors.grey[300],
                  child: Text(
                    "Hangi İlacı Kullandınız",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HangiIlac()));
                  }),
            ),
            Container(
              width: 340,
              height: 60,
              margin: EdgeInsets.only(left: 35, right: 20, top: 20),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Colors.grey[300],
                  child: Text(
                    "Ağrı Yeri",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AgriYeri()));
                  }),
            ),
            Container(
              width: 340,
              height: 60,
              margin: EdgeInsets.only(left: 35, right: 20, top: 20),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Colors.grey[300],
                  child: Text(
                    "Semptomlar",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Semptomlar()));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
