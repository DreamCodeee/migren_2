import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrenuygulamasi/anasayfa.dart';

import 'auth/auth_main_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white)
      ]);

  //firebase i çalıştır
  await Firebase.initializeApp();

  runApp(MyApp());
}

class Controller extends GetxController {
  var checkBool = false.obs;
  var sabit = false.obs;
  var hafif = false.obs;
  var migren = false.obs;
  var delici = false.obs;
  var baski = false.obs;
  var kesici = false.obs;
  var gerilim = false.obs;
  var zonklayici = false.obs;
}

class Controllerr extends GetxController {
  var checkBool = false.obs;
  var a = false.obs;
  var b = false.obs;
  var c = false.obs;
  var d = false.obs;
  var e = false.obs;
  var f = false.obs;
  var g = false.obs;
  var h = false.obs;
  var i = false.obs;
  var j = false.obs;
  var k = false.obs;
  var l = false.obs;
  var m = false.obs;
  var n = false.obs;
  var p = false.obs;
  var r = false.obs;
}

class MyApp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Migren Rehberim',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple,
          centerTitle: true,
          elevation: 0,
          textTheme: GoogleFonts.quicksandTextTheme(
            Theme.of(context).textTheme,
          ).copyWith(
            headline6: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        textTheme: GoogleFonts.quicksandTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: _auth.currentUser != null ? AnaSayfa() : AuthMainView(),
    );
  }
}
