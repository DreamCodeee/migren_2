import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:migrenuygulamasi/home/anketler/view/anketler.dart';

class AnketFourController extends GetxController {
  PageController pageController = PageController();
  String a1;
  String a2;
  String a3;
  String a4;
  String a5;
  String a6;
  String a7;

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
        int.parse(a6) +
        int.parse(a7);

    List<dynamic> anketFourList = [
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

              anketFourList = a.data()['anketler_4'];

              if (a.exists) {
                final DocumentReference documentReference = FirebaseFirestore
                    .instance
                    .collection("anketler")
                    .doc(auth.currentUser.uid);
                anketFourList.add(
                    formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]) +
                        ' * ' +
                        formatDate(DateTime.now().add(Duration(days: 90)),
                            [yyyy, '-', mm, '-', dd]) +
                        ' * ' +
                        anketOneResult.toString());
                return await documentReference.update({
                  'anketler_4': anketFourList,
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
                  'anketler_4': anketFourList,
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
