import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:migrenuygulamasi/auth/login/view/login_view.dart';
import 'package:migrenuygulamasi/auth/register/view/register_view.dart';
import 'package:migrenuygulamasi/conts/colors.dart';

class AuthMainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              'Migren\nRehberim',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            Spacer(),
            MaterialButton(
              minWidth: double.infinity,
              color: BUTTON_COLOR,
              onPressed: () => Get.to(() => LoginView()),
              child: Text(
                'Giriş Yap',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            MaterialButton(
              minWidth: double.infinity,
              color: BUTTON_COLOR,
              onPressed: () => Get.to(() => RegisterView()),
              child: Text(
                'Kayıt Ol',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
