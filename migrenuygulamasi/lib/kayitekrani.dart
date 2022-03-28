import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:migrenuygulamasi/anasayfa.dart';
import 'package:migrenuygulamasi/girisekrani.dart';

class kayitEkrani extends StatefulWidget {
  @override
  _kayitEkraniState createState() => _kayitEkraniState();
}

class _kayitEkraniState extends State<kayitEkrani> {
  //....kayıt parametreleri tutucuları
  String email, sifre, yas, boy, kilo, cinsiyet, meslek, sehir;

  //.....Form durumuna göre bir anahtar belirledik
  var _formAnahtari = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        title: Text('Migren uygulaması'),
        backgroundColor: Colors.purple[300],
        centerTitle: true,
      ),
      body: Form(
        key: _formAnahtari,
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    color: Colors.grey[300],
                    child: TextFormField(
                      onChanged: (alinanMail) {
                        setState(() {
                          email = alinanMail; //email tutucuya aktardık
                        });
                      },
                      ////... //validatior=Doğrulayıcı
                      validator: (alinanMail) {
                        if (alinanMail.contains("@")) {
                          return null;
                        } else {
                          return "Mail Geçersiz";
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email Girin",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Colors.grey[300],
                    child: TextFormField(
                      onChanged: (alinanSifre) {
                        setState(() {
                          sifre = alinanSifre;
                        });
                      },
                      validator: (alinanSifre) {
                        if (alinanSifre.length >= 6) {
                          return null;
                        } else {
                          return "En az 6 karakter";
                        }
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Şifre Girin",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Colors.grey[300],
                    child: TextFormField(
                      onChanged: (alinanYas) {
                        setState(() {
                          yas = alinanYas;
                        });
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Yaş Girin",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Colors.grey[300],
                    child: TextFormField(
                      onChanged: (alinanBoy) {
                        setState(() {
                          boy = alinanBoy;
                        });
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Boy Girin",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Colors.grey[300],
                    child: TextFormField(
                      onChanged: (alinanKilo) {
                        setState(() {
                          kilo = alinanKilo;
                        });
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Kilo Girin",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Colors.grey[300],
                    child: TextFormField(
                      onChanged: (alinanCinsiyet) {
                        setState(() {
                          cinsiyet = alinanCinsiyet;
                        });
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Cinsiyet Girin",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Colors.grey[300],
                    child: TextFormField(
                      onChanged: (alinanMeslek) {
                        setState(() {
                          meslek = alinanMeslek;
                        });
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Meslek Girin",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Colors.grey[300],
                    child: TextFormField(
                      onChanged: (alinanSehir) {
                        setState(() {
                          sehir = alinanSehir;
                        });
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Şehir Girin",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        kayitEkle();
                      },
                      child: Text('Kaydol'),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        //.....zaten hesabı varsa giriş sayfasına yönlendirilsin.
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => GirisEkrani()));
                      },
                      child: Text(
                        'Zaten Hesabın Var',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

// ..........email ve şifreye göre kullanıcıyı firebase de ekleme
  void kayitEkle() {
    if (_formAnahtari.currentState.validate()) {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: sifre)
          .then((user) {
        //.....başarılıysa anasayfaya git
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => AnaSayfa()),
            (Route<dynamic> route) => false);
      }).catchError((hata) {
        //Başarılı değilse hata mesajı göster
        Fluttertoast.showToast(msg: hata);
      });
    }
  }
}
