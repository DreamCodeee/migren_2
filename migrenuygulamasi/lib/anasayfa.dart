import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:migrenuygulamasi/adimsayar.dart';
import 'package:migrenuygulamasi/auth/auth_main_view.dart';
import 'package:migrenuygulamasi/basagrisig%C3%BCnl%C3%BCg%C3%BC.dart';
import 'package:migrenuygulamasi/egzersizler.dart';
import 'package:migrenuygulamasi/faydalibilgiler.dart';
import 'package:migrenuygulamasi/home/anketler/view/anketler.dart';
import 'package:migrenuygulamasi/home_controller.dart';
import 'package:migrenuygulamasi/ilachatirlatmasi.dart';
import 'package:migrenuygulamasi/kullanimkilavuzu.dart';
import 'package:migrenuygulamasi/rapor.dart';

class AnaSayfa extends StatefulWidget {
  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  HomeController hc = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        title: Text("Anasayfa"),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Get.offAll(() => AuthMainView());
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 340,
              height: 60,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Colors.grey[300],
                  child: Text(
                    "Başağsırısı Günlüğü",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => basAgrisi()));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 340,
                height: 60,
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    color: Colors.grey[300],
                    child: Text(
                      "Egzersizler",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => egzersizler()));
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 150,
                    height: 60,
                    margin: EdgeInsets.only(
                      left: 28,
                    ),
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        color: Colors.grey[300],
                        child: Text(
                          "Anketler",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Anketler()));
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 150,
                    height: 60,
                    margin: EdgeInsets.only(
                      right: 30,
                    ),
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        color: Colors.grey[300],
                        child: Text(
                          "Rapor",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => rapor()));
                        }),
                  ),
                ),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 103,
                      height: 60,
                      margin: EdgeInsets.only(
                        left: 30,
                      ),
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          color: Colors.grey[300],
                          child: Text(
                            "İlaç Hatırlatması",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => IlacHatirlatmasi()));
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 90,
                      height: 60,
                      margin: EdgeInsets.only(
                        left: 9,
                        right: 9,
                      ),
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          color: Colors.grey[300],
                          child: Text(
                            "Adım Sayar",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => adimSayar()));
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: 90,
                      height: 60,
                      margin: EdgeInsets.only(
                        right: 29,
                      ),
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          color: Colors.grey[300],
                          child: Text(
                            "Faydalı Bilgiler",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => faydaliBilgiler()));
                          }),
                    ),
                  ),
                ]),
            Container(
              margin: EdgeInsets.only(
                right: 40,
                left: 40,
              ),
              child: Text(
                "Migren",
                style: TextStyle(
                  fontFamily: "AbrilFatface",
                  fontSize: 60,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: 20,
                left: 20,
              ),
              child: Text(
                "Rehberim",
                style: TextStyle(
                  fontFamily: "AbrilFatface",
                  fontSize: 60,
                ),
              ),
            ),
            Container(
              width: 340,
              height: 40,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Colors.grey[300],
                  child: Text(
                    "Kullanım Kılavuzu",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => kullanimKilavuzu()));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
