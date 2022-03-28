import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:migrenuygulamasi/home/anketler/view/anketler.dart';

class AnketTwoController extends GetxController {
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

  int anketOneResult = 0;

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

  setQuestionEight(String v) {
    a8 = v;
    update();
  }

  setQuestionNine(String v) {
    a9 = v;
    update();
  }

  setQuestionTen(String v) {
    a10 = v;
    update();
  }

  setQuestionEleven(String v) {
    a11 = v;
    update();
  }

  setQuestionTwelve(String v) {
    a12 = v;
    update();
  }

  calculateAnketOne() {
    anketOneResult = int.parse(a1) +
        int.parse(a2) +
        int.parse(a3) +
        int.parse(a4) +
        int.parse(a5) +
        int.parse(a6) +
        int.parse(a7) +
        int.parse(a8) +
        int.parse(a9) +
        int.parse(a10) +
        int.parse(a11) +
        int.parse(a12);

    String derece;

    if (anketOneResult >= 0 && anketOneResult < 25) {
      derece = 'Kötü';
    } else if (anketOneResult >= 25 && anketOneResult < 35) {
      print('derece 2');
      derece = 'Orta';
    } else if (anketOneResult >= 35) {
      print('derece 3');
      derece = 'İyi';
    }

    List<dynamic> anketTwoList = [
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
          Text('Hastanın yaşam kalitesi : ' + derece.toString()),
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

              anketTwoList = a.data()['anketler_2'];

              if (a.exists) {
                final DocumentReference documentReference = FirebaseFirestore
                    .instance
                    .collection("anketler")
                    .doc(auth.currentUser.uid);

                anketTwoList.add(
                    formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]) +
                        ' * ' +
                        formatDate(DateTime.now().add(Duration(days: 90)),
                            [yyyy, '-', mm, '-', dd]) +
                        ' * ' +
                        anketOneResult.toString());
                return await documentReference.update({
                  'anketler_2': anketTwoList,
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
                  'anketler_2': anketTwoList,
                }).then((value) {
                  Get.back();
                  Get.back();
                });
              }
            },
            child: Text('Kapat'))
      ],
    ));

    print('RESULT === ' + anketOneResult.toString());

    update();
  }
}
