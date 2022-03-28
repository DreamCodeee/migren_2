import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:migrenuygulamasi/anasayfa.dart';

import 'kayitekrani.dart';

class GirisEkrani extends StatefulWidget {
  @override
  _GirisEkraniState createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  //........email ve şifreye göre giriş yapma....
  String email, sifre;
  //.....doğrulama anahtarı....
  var _formAnahtari = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[200],
        appBar: AppBar(
          backgroundColor: Colors.purple[300],
          title: Text("Giriş Ekranı"),
        ),
        body: Form(
          key: _formAnahtari,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.grey[300],
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (alinanEmail) {
                          email = alinanEmail;
                        },
                        validator: (alinanMail) {
                          return alinanMail.contains("@")
                              ? null
                              : "Geçersiz email";
                        },
                        decoration: InputDecoration(
                          focusColor: Colors.grey[300],
                          labelText: "Email",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.grey[300],
                      child: TextFormField(
                        obscureText: true,
                        onChanged: (alinanSifre) {
                          sifre = alinanSifre;
                        },
                        validator: (alinanSifre) {
                          return alinanSifre.length >= 6
                              ? null
                              : "Geçersiz email";
                        },
                        decoration: InputDecoration(
                          labelText: ("Şifre"),
                          fillColor: Colors.black,
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        girisYap();
                      },
                      child: Text("Giriş"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => kayitEkrani()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Hesabım Yok",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

//...........email ve şifreye göre doğrulama yapıp giriş yapacak...
  void girisYap() {
    if (_formAnahtari.currentState.validate()) {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: sifre)
          .then((user) {
        //....eğer başarılı ise anasayfaya git
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => AnaSayfa()), (route) => false);
      }).catchError((hata) {
        Fluttertoast.showToast(msg: hata);
      });
    }
  }
}
