import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:migrenuygulamasi/conts/utils.dart';

import 'home/anketler/view/anketler.dart';

class HomeController extends GetxController {
  final Stream<QuerySnapshot> anketlerStream = FirebaseFirestore.instance
      .collection('anketler')
      .where('user_id', isEqualTo: auth.currentUser.uid)
      .snapshots();
  DateTime formatted;
  DateTime formatted2;
  DateTime formatted3;
  DateTime formatted4;
  DateTime formatted5;

  @override
  Future<void> onInit() async {
    await getData();
    super.onInit();
  }

  getData() async {
    await FirebaseFirestore.instance
        .collection('anketler')
        .doc(auth.currentUser.uid)
        .get()
        .then((DocumentSnapshot<Map<String, dynamic>> value) {
      List<dynamic> gelenData = value.data()['anketler_1'];
      List<dynamic> gelenData2 = value.data()['anketler_2'];
      List<dynamic> gelenData3 = value.data()['anketler_3'];
      List<dynamic> gelenData4 = value.data()['anketler_4'];
      List<dynamic> gelenData5 = value.data()['anketler_5'];

      if (gelenData.isEmpty ||
          gelenData2.isEmpty ||
          gelenData3.isEmpty ||
          gelenData4.isEmpty ||
          gelenData5.isEmpty) {
        buildAlertDialog('');
      } else {
        String tarihParse = gelenData.last.toString();
        String tarihParse2 = gelenData2.last.toString();
        String tarihParse3 = gelenData3.last.toString();
        String tarihParse4 = gelenData4.last.toString();
        String tarihParse5 = gelenData5.last.toString();

        formatted = DateTime.parse(tarihParse.split(' * ')[1]);
        formatted2 = DateTime.parse(tarihParse2.split(' * ')[1]);
        formatted3 = DateTime.parse(tarihParse3.split(' * ')[1]);
        formatted4 = DateTime.parse(tarihParse4.split(' * ')[1]);
        formatted5 = DateTime.parse(tarihParse5.split(' * ')[1]);

        if (formatted.isBefore(DateTime.now())) {
          buildAlertDialog('1');
        } else if (formatted2.isBefore(DateTime.now())) {
          buildAlertDialog('2');
        } else if (formatted3.isBefore(DateTime.now())) {
          buildAlertDialog('3');
        } else if (formatted4.isBefore(DateTime.now())) {
          buildAlertDialog('4');
        } else if (formatted5.isBefore(DateTime.now())) {
          buildAlertDialog('5');
        }

      }
    });
  }
}
