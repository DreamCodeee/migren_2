import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgriTetikleyici extends StatefulWidget {
  @override
  State<AgriTetikleyici> createState() => _AgriTetikleyiciState();
}

class _AgriTetikleyiciState extends State<AgriTetikleyici> {
  List<AgriTipiModel> tetikleyici = [
    AgriTipiModel(name: 'Alkol', isSelected: false),
    AgriTipiModel(name: 'Kafein Tüketimi', isSelected: false),
    AgriTipiModel(name: 'Günlük Düzenin Değişmesi', isSelected: false),
    AgriTipiModel(name: 'Hava Değişikliği(Rüzgar)', isSelected: false),
    AgriTipiModel(name: 'Yanlış Pozisyonda kalma', isSelected: false),
    AgriTipiModel(name: 'Boyun Ağrısı', isSelected: false),
    AgriTipiModel(name: 'Yoğun Fiziksel Aktivite', isSelected: false),
    AgriTipiModel(name: 'Mensürasyon', isSelected: false),
    AgriTipiModel(name: 'Uyku Bozukluğu', isSelected: false),
    AgriTipiModel(name: 'Sigara', isSelected: false),
    AgriTipiModel(name: 'Stres', isSelected: false),
    AgriTipiModel(name: 'Sivri Kokular', isSelected: false),
    AgriTipiModel(name: 'Tetikleyici Yiyeceklerin Tüketimi', isSelected: false),
    AgriTipiModel(name: 'Alerjik Reaksiyonlar', isSelected: false),
    AgriTipiModel(name: 'Az Su Tüketimi', isSelected: false),
  ];

  List<dynamic> updateList = [];

  @override
  void initState() {
    updateList.clear();
    print('LİSTE == ' + updateList.length.toString());
    getData();
    super.initState();
  }

  CollectionReference basAgrisi =
      FirebaseFirestore.instance.collection('bas_agrisi');

  final FirebaseAuth auth = FirebaseAuth.instance;

  getData() async {
    DocumentSnapshot<Map<String, dynamic>> a = await FirebaseFirestore.instance
        .collection("bas_agrisi")
        .doc(auth.currentUser.uid)
        .get();
    updateList = a.data()['tetikleyici'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Başağsırısı Günlüğü"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 40, right: 40, top: 10),
              padding: EdgeInsets.all(6),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.purple,
                border: Border.all(
                    color: Colors.pink[800], // set border color
                    width: 3.0), // set border width
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0)), // set rounded corner radius
              ),
              child: Text(
                "Tetikleyiciler",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: tetikleyici.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Container(
                    width: 250,
                    height: 65,
                    margin: EdgeInsets.only(left: 40, top: 10),
                    child: CheckboxListTile(
                      title: Text(
                        tetikleyici[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                      value: tetikleyici[index].isSelected,
                      onChanged: (value) {
                        setState(() {
                          tetikleyici[index].isSelected =
                              !tetikleyici[index].isSelected;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                for (var item in tetikleyici) {
                  if (item.isSelected == true) {
                    updateList.add(item.name +
                        ' * ' +
                        formatDate(DateTime.now(),
                            [dd, '-', mm, '-', yyyy, ' ', HH, ':', nn]));

                    print(updateList.length);
                  } else {
                    updateList.remove(item.name);
                    print('CLEAN');
                  }
                }
                print('LİSTE UZUNLUGU == ' + updateList.length.toString());

                basAgrisi.doc(auth.currentUser.uid).set({
                  'tetikleyici': updateList,
                }, SetOptions(merge: true)).then((value) => Get.back());
              },
              child: Text('Kaydet'),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

class AgriTipiModel {
  String name;
  bool isSelected;

  AgriTipiModel({this.name, this.isSelected});
}
