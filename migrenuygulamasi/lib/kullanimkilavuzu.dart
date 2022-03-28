import 'package:flutter/material.dart';
import 'package:migrenuygulamasi/soru_1.dart';
import 'package:migrenuygulamasi/soru_2.dart';
import 'package:migrenuygulamasi/soru_3.dart';
import 'package:migrenuygulamasi/widgets/custom_button.dart';

class kullanimKilavuzu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Kullanim Kılavuzu"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
              "Migren Rehberimi Nasıl Kullanabilirim?", Colors.pinkAccent, () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => IlkSoru()));
          }),
          CustomButton(
            "Migrenimi Tanıyor Muyum?",
            Colors.purpleAccent,
            () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => IkinciSoru()));
            },
          ),
          CustomButton(
            "Migrenimde Egzersiz Neden Önemli?",
            Colors.teal,
            () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UcuncuSoru()));
            },
          ),
        ],
      ),
      /* body: Scrollbar(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              width: 400,
              height: 70,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                color: Colors.pinkAccent,
                child: Text(
                  "Migren Rehberimi Nasıl Kullanabilirim?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => IlkSoru()));
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 400,
              height: 70,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                color: Colors.purpleAccent,
                child: Text(
                  "Migrenimi Tanıyor Muyum?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => IkinciSoru()));
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 400,
              height: 70,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                color: Colors.teal,
                child: Text(
                  "Migrenimde Egzersiz Neden Önemli?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UcuncuSoru()));
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ), */
    );
  }
}
