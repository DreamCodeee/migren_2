import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgriTipi extends StatefulWidget {
  @override
  State<AgriTipi> createState() => _AgriTipiState();
}

class _AgriTipiState extends State<AgriTipi> {
  List<AgriTipiModel> agriTipi = [
    AgriTipiModel(name: 'Küme', isSelected: false),
    AgriTipiModel(name: 'Sabit', isSelected: false),
    AgriTipiModel(name: 'Hafif Ağrı', isSelected: false),
    AgriTipiModel(name: 'Migren', isSelected: false),
    AgriTipiModel(name: 'Delici', isSelected: false),
    AgriTipiModel(name: 'Baskılayıcı', isSelected: false),
    AgriTipiModel(name: 'Kesici', isSelected: false),
    AgriTipiModel(name: 'Gerilim', isSelected: false),
    AgriTipiModel(name: 'Zonklayıcı', isSelected: false),
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
    updateList = a.data()['agri_tipi'];
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
                "Ağrı Tipi",
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
              itemCount: agriTipi.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 250,
                  height: 45,
                  margin: EdgeInsets.only(left: 40, top: 10),
                  child: CheckboxListTile(
                    title: Text(
                      agriTipi[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    value: agriTipi[index].isSelected,
                    onChanged: (value) {
                      setState(() {
                        agriTipi[index].isSelected =
                            !agriTipi[index].isSelected;
                      });
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                for (var item in agriTipi) {
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
                  'agri_tipi': updateList,
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
