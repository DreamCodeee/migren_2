import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:get/get.dart';

class SaatSecim extends StatefulWidget {
  @override
  State<SaatSecim> createState() => _SaatSecimState();
}

class _SaatSecimState extends State<SaatSecim> {
  DateTime myDate;
  bool isSelected = false;
  double saat = 0.0;
  int emoji = 0;

  List<IconModel> imageList = [
    IconModel(imagePath: 'Assets/image/başagrisi.jpg', isSelected: false),
    IconModel(imagePath: 'Assets/image/kızgın.jpg', isSelected: false),
    IconModel(imagePath: 'Assets/image/mutlu.jpg', isSelected: false),
    IconModel(imagePath: 'Assets/image/üzgün.jpg', isSelected: false),
  ];

  CollectionReference basAgrisi =
      FirebaseFirestore.instance.collection('bas_agrisi');

  final FirebaseAuth auth = FirebaseAuth.instance;
  List<dynamic> tarihList = [];
  List<dynamic> sureList = [];
  List<dynamic> emojiList = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    DocumentSnapshot<Map<String, dynamic>> a = await FirebaseFirestore.instance
        .collection("bas_agrisi")
        .doc(auth.currentUser.uid)
        .get();
    tarihList = a.data()['tarih'];
    sureList = a.data()['agri_suresi'];
    emojiList = a.data()['emoji'];
    print(tarihList);
    print(sureList);
    print(emojiList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Başağsırısı Günlüğü"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                child: Text(
                  "Ağrının Başladığı Tarih ve Saati Giriniz",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 20),
              DateTimePicker(
                type: DateTimePickerType.dateTimeSeparate,
                dateMask: 'd/MM/yyyy',
                initialValue: DateTime.now().toString(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                dateLabelText: 'Tarih',
                timeLabelText: "Saat",
                onChanged: (val) {
                  myDate = DateTime.parse(val);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 60),
              Container(
                child: Text(
                  "Ağrınız Ne Kadar Sürdü?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                    fontSize: 20,
                  ),
                ),
              ),
              SpinBox(
                min: 0,
                max: 100,
                value: 0,
                onChanged: (value) {
                  setState(() {
                    saat = value;
                    print(saat);
                  });
                },
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                child: Text(
                  "Şimdi Nasılsın? (Ağrı-VAS)",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 100,
                width: Get.size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: imageList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            imageList[index].isSelected =
                                !imageList[index].isSelected;

                            emoji = index;
                          });
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          margin: EdgeInsets.only(
                            left: 15,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: imageList[index].isSelected == true
                                ? Border.all(color: Colors.blueAccent, width: 5)
                                : Border.all(color: Colors.white),
                          ),
                          //child: Center(child: Text(index.toString())),
                          child: Image.asset(imageList[index].imagePath),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  if (myDate == null) {
                    myDate = DateTime.now();
                  }

                  tarihList.add(formatDate(
                      myDate, [dd, '-', mm, '-', yyyy, ' ', HH, ':', nn]));
                  sureList.add(formatDate(
                          myDate, [dd, '-', mm, '-', yyyy, ' ', HH, ':', nn]) +
                      ' * ' +
                      saat.floor().toString());
                  emojiList.add(formatDate(DateTime.now(),
                          [dd, '-', mm, '-', yyyy, ' ', HH, ':', nn]) +
                      ' * ' +
                      emoji.toString());

                  basAgrisi.doc(auth.currentUser.uid).set({
                    'tarih': tarihList,
                    'agri_suresi': sureList,
                    'emoji': emojiList,
                  }, SetOptions(merge: true)).then((value) => {Get.back()});
                },
                child: Text(
                  'Kaydet',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconModel {
  String imagePath;
  bool isSelected;

  IconModel({this.imagePath, this.isSelected});
}
