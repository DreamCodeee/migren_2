import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:migrenuygulamasi/anasayfa.dart';
import 'package:migrenuygulamasi/conts/colors.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  loginUser() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.offAll(() => AnaSayfa());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        buildSnackBar('Uyarı', 'Mail sisteme kayıtlı değil.');
      } else if (e.code == 'wrong-password') {
        buildSnackBar('Uyarı', 'Yanlış şifre.');
      }
    }
  }
}
