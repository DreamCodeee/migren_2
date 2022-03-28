import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgriYeri extends StatefulWidget {
  @override
  State<AgriYeri> createState() => _AgriYeriState();
}

class _AgriYeriState extends State<AgriYeri> {
  List<AgriTipiModel> agriyeri = [
    AgriTipiModel(name: 'Gözün Arkası', isSelected: false),
    AgriTipiModel(name: 'Başın Arkası', isSelected: false),
    AgriTipiModel(name: 'Sağ Taraf', isSelected: false),
    AgriTipiModel(name: 'Sol Taraf', isSelected: false),
    AgriTipiModel(name: 'Her İki Taraf', isSelected: false),
    AgriTipiModel(name: 'Alın', isSelected: false),
    AgriTipiModel(name: 'Boyundan Gelen', isSelected: false),
    AgriTipiModel(name: 'Şakak', isSelected: false),
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
    updateList = a.data()['Agri_yeri'];
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
                "Ağrının Yeri",
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
              itemCount: agriyeri.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 250,
                  height: 55,
                  margin: EdgeInsets.only(left: 40, top: 10),
                  child: CheckboxListTile(
                    title: Text(
                      agriyeri[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 23,
                      ),
                    ),
                    value: agriyeri[index].isSelected,
                    onChanged: (value) {
                      setState(() {
                        agriyeri[index].isSelected =
                            !agriyeri[index].isSelected;
                      });
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  for (var item in agriyeri) {
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
                    'Agri_yeri': updateList,
                  }, SetOptions(merge: true)).then((value) => Get.back());
                },
                child: Text('Kaydet'),
              ),
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
