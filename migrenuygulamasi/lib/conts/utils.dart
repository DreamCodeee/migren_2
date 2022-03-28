import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:migrenuygulamasi/home/anketler/view/anketler.dart';

buildAlertDialog(String anketNumber) {
  Get.dialog(
    AlertDialog(
      title: Text('Uyarı!'),
      content: Text('Anket $anketNumber çözmeniz gerekmektedir.'),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
              Navigator.push<void>(
                Get.context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => Anketler(),
                ),
              );
            },
            child: Text('Anket Çöz')),
      ],
    ),
    barrierDismissible: false,
  );
}
