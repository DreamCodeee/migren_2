import 'package:flutter/material.dart';
import 'package:migrenuygulamasi/egzersizz_1.dart';
import 'package:migrenuygulamasi/egzersizz_2.dart';
import 'package:migrenuygulamasi/egzersizz_3.dart';
import 'package:migrenuygulamasi/egzersizz_4.dart';
import 'package:migrenuygulamasi/egzersizz_5.dart';

class egzersizler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        title: Text("Egzersizler"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Container(
                width: 400,
                height: 60,
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Colors.grey[300],
                  child: Text(
                    "Solunum egzersizleri",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Ilkegzersizz()));
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 400,
                  height: 60,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      color: Colors.grey[300],
                      child: Text(
                        "Postür egzersizleri",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Ikinciegzersizz()));
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 400,
                  height: 60,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      color: Colors.grey[300],
                      child: Text(
                        "Germe egzersizleri",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Ucuncuegzersizz()));
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 400,
                  height: 60,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      color: Colors.grey[300],
                      child: Text(
                        "Stabilizasyon egzersizleri",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dorduncuegzersizz()));
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 400,
                  height: 60,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    color: Colors.grey[300],
                    child: Text(
                      "Kuvvetlendirme egzersizleri ",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Besinciegzersizz()));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
