import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:migrenuygulamasi/auth/login/controller/login_controller.dart';
import 'package:migrenuygulamasi/conts/colors.dart';

class LoginView extends StatelessWidget {
  var _formController = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Giriş Yap'),
        ),
        body: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (loginController) {
            return Form(
              key: _formController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: loginController.emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mail giriniz';
                        } else if (value.contains("@")) {
                          return null;
                        } else {
                          return "Mail Geçersiz";
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: loginController.passwordController,
                      validator: (alinanSifre) {
                        if (alinanSifre == null || alinanSifre.isEmpty) {
                          return 'Şifre giriniz';
                        } else if (alinanSifre.length >= 6) {
                          return null;
                        } else {
                          return "En az 6 karakter";
                        }
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Şifre",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),
                    MaterialButton(
                      color: BUTTON_COLOR,
                      onPressed: () {
                        if (_formController.currentState.validate()) {
                          loginController.loginUser();
                        }
                      },
                      child: Text(
                        'Giriş Yap',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
