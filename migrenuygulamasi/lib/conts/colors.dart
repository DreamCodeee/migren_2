import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color BACKGROUND_COLOR = Colors.purple[200];
Color BUTTON_COLOR = Colors.purple;

buildSnackBar(String title, String message) {
  Get.snackbar('', '',
      duration: Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: BACKGROUND_COLOR,
      titleText: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ));
}
