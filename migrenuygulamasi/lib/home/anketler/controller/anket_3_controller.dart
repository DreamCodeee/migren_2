import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class AnketThreeController extends GetxController {
  PageController pageController = PageController();
  String a1;
  String a2;
  String a3;
  String a4;
  String a5;
  String a6;
  String a7;
  String a8;
  String a9;
  String a10;
  String a11;
  String a12;

  bool firstQuestion = false;

  int anketOneResult = 0;

  setNextPage() {
    pageController.nextPage(
        duration: Duration(seconds: 1), curve: Curves.decelerate);
    update();
  }

  setPreviousPage() {
    pageController.previousPage(
        duration: Duration(seconds: 1), curve: Curves.decelerate);
    update();
  }

  setQuestionOne(String v) {
    a1 = v;
    if (v == '0') {
      setFirstQuestion(true);
    } else {
      setFirstQuestion(false);
    }

    update();
  }

  setFirstQuestion(bool b) {
    firstQuestion = b;
    print(firstQuestion);
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

  calculateAnketOne() {
    // Hesaplama Toplam Skor: (8 x Yüksek Şiddetli Aktivite Gün Sayısı x Dakika) +
    //(4 x Orta Şiddetli Aktivite Gün Sayısı x Dakika) + (3,3 x Yürüme Gün Sayısı x Dakika)

    double result = (8 * int.parse(a1) * int.parse(a2)) +
        (4 * int.parse(a3) * int.parse(a4)) +
        (3.3 * int.parse(a5) * int.parse(a6));

    List<dynamic> anketThreeList = [
      formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]) +
          ' * ' +
          formatDate(DateTime.now().add(Duration(days: 90)),
              [yyyy, '-', mm, '-', dd]) +
          ' * ' +
          result.toString()
    ];

    Get.dialog(AlertDialog(
      title: Text('Anket Sonucu'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Hastanın anket puanı : ' + result.toString()),
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

              anketThreeList = a.data()['anketler_3'];

              if (a.exists) {
                final DocumentReference documentReference = FirebaseFirestore
                    .instance
                    .collection("anketler")
                    .doc(auth.currentUser.uid);
                anketThreeList.add(
                    formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]) +
                        ' * ' +
                        formatDate(DateTime.now().add(Duration(days: 90)),
                            [yyyy, '-', mm, '-', dd]) +
                        ' * ' +
                        result.toString());
                return await documentReference.update({
                  'anketler_3': anketThreeList,
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
                  'anketler_3': anketThreeList,
                }).then((value) {
                  Get.back();
                  Get.back();
                });
              }
            },
            child: Text('Kapat'))
      ],
    ));

    update();
  }
}
