import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class AnketController extends GetxController {
  PageController pageController = PageController();

  CollectionReference anket = FirebaseFirestore.instance.collection('anketler');

  String a1;
  String a2;
  String a3;
  String a4;
  String a5;
  String a6;
  String a7;

  int anketOneResult = 0;

  @override
  void onInit() {
    super.onInit();
  }

  setNextPage() {
    pageController.nextPage(
        duration: Duration(seconds: 1), curve: Curves.easeIn);
    update();
  }

  setPreviousPage() {
    pageController.previousPage(
        duration: Duration(seconds: 1), curve: Curves.easeIn);
    update();
  }

  setQuestionOne(String v) {
    a1 = v;
    update();
  }

  setQuestionTwo(String v) {
    a2 = v;
    update();
  }

  setQuestionThree(String v) {
    a3 = v;
    update();
  }

  setQuestionFour(String v) {
    a4 = v;
    update();
  }

  setQuestionFive(String v) {
    a5 = v;
    update();
  }

  setQuestionSix(String v) {
    a6 = v;
    update();
  }

  setQuestionSeven(String v) {
    a7 = v;
    update();
  }

  calculateAnketOne() {
    anketOneResult = int.parse(a1) +
        int.parse(a2) +
        int.parse(a3) +
        int.parse(a4) +
        int.parse(a5) +
        int.parse(a6);

    String derece;
    if (anketOneResult >= 0 && anketOneResult <= 5) {
      print('derece 1');
      derece = '1';
    } else if (anketOneResult >= 6 && anketOneResult <= 10) {
      print('derece 2');
      derece = '2';
    } else if (anketOneResult >= 11 && anketOneResult <= 20) {
      print('derece 3');
      derece = '3';
    } else if (anketOneResult >= 21) {
      print('derece 4');
      derece = '4';
    }

    List<dynamic> anketOneList = [
      formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]) +
          ' * ' +
          formatDate(DateTime.now().add(Duration(days: 90)),
              [yyyy, '-', mm, '-', dd]) +
          ' * ' +
          anketOneResult.toString()
    ];

    Get.dialog(AlertDialog(
      title: Text('Anket Sonucu'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Hastanın anket puanı : ' + anketOneResult.toString()),
          Text('Hastanın MİDAS derecesi : ' + derece),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () async {
              DocumentSnapshot<Map<String, dynamic>> a = await FirebaseFirestore
                  .instance
                  .collection("anketler")
                  .doc(auth.currentUser.uid)
                  .get();

              anketOneList = a.data()['anketler_1'];

              if (a.exists) {
                print('111111');
                final DocumentReference documentReference = FirebaseFirestore
                    .instance
                    .collection("anketler")
                    .doc(auth.currentUser.uid);

                anketOneList.add(
                    formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]) +
                        ' * ' +
                        formatDate(DateTime.now().add(Duration(days: 90)),
                            [yyyy, '-', mm, '-', dd]) +
                        ' * ' +
                        anketOneResult.toString());

                return await documentReference.update({
                  'anketler_1': anketOneList,
                }).then((value) {
                  Get.back();
                  Get.back();
                });
              } else {
                final DocumentReference documentReference = FirebaseFirestore
                    .instance
                    .collection("anketler")
                    .doc(auth.currentUser.uid);
                return await documentReference.set({
                  'anketler_1': anketOneList,
                }).then((value) {
                  Get.back();
                  Get.back();
                });
              }
            },
            child: Text('Kapat'))
      ],
    ));
    print('İLK ANKET SONUCU === ' + anketOneResult.toString());

    update();
  }
}
