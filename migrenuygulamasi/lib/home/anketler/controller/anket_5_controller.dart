import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:migrenuygulamasi/home/anketler/view/anketler.dart';

class AnketFiveController extends GetxController {
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
  String a13;
  String a14;

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

  setQuestionThirteen(String v) {
    a13 = v;
    update();
  }

  setQuestionFourteen(String v) {
    a14 = v;
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
        int.parse(a12) +
        int.parse(a13) +
        int.parse(a14);

    var anksiyete = int.parse(a1) +
        int.parse(a3) +
        int.parse(a5) +
        int.parse(a7) +
        int.parse(a9) +
        int.parse(a11) +
        int.parse(a13);
    var depresyon = int.parse(a2) +
        int.parse(a4) +
        int.parse(a6) +
        int.parse(a8) +
        int.parse(a10) +
        int.parse(a12) +
        int.parse(a14);

    List<dynamic> anketFiveList = [
      formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]) +
          ' * ' +
          formatDate(DateTime.now().add(Duration(days: 90)),
              [yyyy, '-', mm, '-', dd]) +
          ' * ' +
          anksiyete.toString() +
          ' * ' +
          depresyon.toString()
    ];

    Get.dialog(AlertDialog(
      title: Text('Anket Sonucu'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Anksiyete sonucu  : ' + anksiyete.toString()),
          Text('Depresyon sonucu  : ' + depresyon.toString()),
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

              anketFiveList = a.data()['anketler_5'];

              if (a.exists) {
                final DocumentReference documentReference = FirebaseFirestore
                    .instance
                    .collection("anketler")
                    .doc(auth.currentUser.uid);

                anketFiveList.add(
                    formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]) +
                        ' * ' +
                        formatDate(DateTime.now().add(Duration(days: 90)),
                            [yyyy, '-', mm, '-', dd]) +
                        ' * ' +
                        anksiyete.toString() +
                        ' * ' +
                        depresyon.toString());

                return await documentReference.update({
                  'anketler_5': anketFiveList,
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
                  'anketler_5': anketFiveList,
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
