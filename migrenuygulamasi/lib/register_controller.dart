import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:migrenuygulamasi/auth/auth_main_view.dart';
import 'package:migrenuygulamasi/conts/colors.dart';

class RegisterController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference anket = FirebaseFirestore.instance.collection('anketler');
  CollectionReference basagrisi =
      FirebaseFirestore.instance.collection('bas_agrisi');

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final genderController = TextEditingController();
  final jobController = TextEditingController();
  final cityController = TextEditingController();

  String alcohol;
  String dailyCigarette;
  String yearCigarette;
  String marriageStatus;
  String migraine;
  String inFamily;

  @override
  void onInit() {
    super.onInit();
  }

  setAlcohol(String value) {
    alcohol = value;
    update();
  }

  setDailyCigarette(String value) {
    dailyCigarette = value;
    print('DAİLY : ' + dailyCigarette);
    update();
  }

  setYearCigarette(String value) {
    yearCigarette = value;
    print('YEAR  : ' + yearCigarette);
    update();
  }

  setMarriageStatus(String value) {
    marriageStatus = value;
    print(marriageStatus);
    update();
  }

  setMigraine(String value) {
    migraine = value;
    update();
  }

  setInFamily(String value) {
    inFamily = value;
    update();
  }

  registerUser() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      anket.doc(userCredential.user?.uid).set({
        'anketler_1': 0,
        'anketler_2': 0,
        'anketler_3': 0,
        'anketler_4': 0,
        'anketler_5': 0,
        'user_id': userCredential.user?.uid,
      });
      basagrisi.doc(userCredential.user?.uid).set({
        'agri_suresi': 0,
        'agri_tipi': [],
        'emoji': 0,
        'tarih': 0,
        'user_id': userCredential.user?.uid,
      });

      print(userCredential.user?.uid.toString());
      users.doc(userCredential.user?.uid).set({
        'email': emailController.text,
        'age': ageController.text,
        'height': heightController.text,
        'weight': weightController.text,
        'gender': genderController.text,
        'job': jobController.text,
        'city': cityController.text,
        'alcohol': alcohol,
        'dailyCigarette': dailyCigarette,
        'yearCigarette': yearCigarette,
        'marriageStatus': marriageStatus,
        'migraine': migraine,
        'inFamily': inFamily,
      }).then((value) async {
        buildSnackBar('Hesap oluşturuldu', 'Lütfen giriş yapınız.');
        await Future.delayed(Duration(seconds: 2), () {
          Get.offAll(() => AuthMainView());
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        buildSnackBar('Hata', 'Daha güçlü şifre oluşturunuz.');
      } else if (e.code == 'email-already-in-use') {
        buildSnackBar('Hata', 'Mail sisteme kayıtlı.');
      }
    } catch (e) {
      print(e);
    }
  }
}
