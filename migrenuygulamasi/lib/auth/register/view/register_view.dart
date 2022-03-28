import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:get/get.dart';
import 'package:migrenuygulamasi/auth/register/controller/register_controller.dart';
import 'package:migrenuygulamasi/conts/colors.dart';

class RegisterView extends StatelessWidget {
  var _formController = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kayıt Ol'),
      ),
      body: GetBuilder<RegisterController>(
        init: RegisterController(),
        builder: (registerControler) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: _formController,
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    TextFormField(
                      controller: registerControler.emailController,
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
                      controller: registerControler.passwordController,
                      validator: (alinanSifre) {
                        if (alinanSifre.length >= 6) {
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
                    TextFormField(
                      controller: registerControler.ageController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Yaş giriniz.';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Yaş",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: registerControler.heightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Boy",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Boy giriniz.';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: registerControler.weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Kilo",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Kilo giriniz.';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: registerControler.genderController,
                      decoration: InputDecoration(
                        labelText: "Cinsiyet",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Cinsiyet giriniz.';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: registerControler.jobController,
                      decoration: InputDecoration(
                        labelText: "Meslek",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Meslek giriniz.';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: registerControler.cityController,
                      decoration: InputDecoration(
                        labelText: "Şehir",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Şehir giriniz.';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 15),
                    DropDownFormField(
                      titleText: 'Alkol kullanım alışkanlığı',
                      hintText: 'Lütfen seçim yapınız',
                      value: registerControler.alcohol,
                      onChanged: (value) {
                        registerControler.setAlcohol(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Alkol seçimi yapınız.';
                        } else {
                          return null;
                        }
                      },
                      dataSource: [
                        {
                          "display": "Hemen hemen hergün",
                          "value": "Hemen hemen hergün",
                        },
                        {
                          "display": "Haftada 1-4 gün",
                          "value": "Haftada 1-4 gün",
                        },
                        {
                          "display": "Ayda 1-3 defadan az",
                          "value": "Ayda 1-3 defadan az",
                        },
                        {
                          "display": "Kullanmıyorum",
                          "value": "Kullanmıyorum",
                        },
                      ],
                      textField: 'display',
                      valueField: 'value',
                    ),
                    SizedBox(height: 15),
                    SpinBox(
                      decoration: InputDecoration(
                          labelText: 'Günde içilen sigara sayısı'),
                      min: 0,
                      max: 100,
                      value: 0,
                      onChanged: (value) =>
                          registerControler.setDailyCigarette(value.toString()),
                    ),
                    SizedBox(height: 15),
                    SpinBox(
                      decoration: InputDecoration(
                          labelText: 'Kaç yıldır sigara kullanıyorsunuz?'),
                      min: 0,
                      max: 100,
                      value: 0,
                      onChanged: (value) =>
                          registerControler.setYearCigarette(value.toString()),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 50,
                      width: Get.size.width,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Medeni durum:',
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: CustomRadioButton(
                              elevation: 0,
                              absoluteZeroSpacing: true,
                              unSelectedColor: Theme.of(context).canvasColor,
                              buttonLables: ['Evli', 'Bekar'],
                              buttonValues: ["Evli", "Bekar"],
                              buttonTextStyle: ButtonTextStyle(
                                  selectedColor: Colors.white,
                                  unSelectedColor: Colors.black,
                                  textStyle: TextStyle(fontSize: 16)),
                              radioButtonValue: (value) =>
                                  registerControler.setMarriageStatus(value),
                              selectedColor: Theme.of(context).accentColor,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 15),
                    SpinBox(
                      decoration: InputDecoration(
                          labelText: 'Migren probleminiz kaç yıldır var?'),
                      min: 0,
                      max: 100,
                      value: 0,
                      onChanged: (value) =>
                          registerControler.setMigraine(value.toString()),
                    ),
                    SizedBox(height: 15),

                    Container(
                      height: 50,
                      width: Get.size.width,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Ailede var mı?',
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: CustomRadioButton(
                              elevation: 0,
                              absoluteZeroSpacing: true,
                              unSelectedColor: Theme.of(context).canvasColor,
                              buttonLables: ['Evet', 'Hayır'],
                              buttonValues: ["Evet", "Hayır"],
                              buttonTextStyle: ButtonTextStyle(
                                  selectedColor: Colors.white,
                                  unSelectedColor: Colors.black,
                                  textStyle: TextStyle(fontSize: 16)),
                              radioButtonValue: (value) =>
                                  registerControler.setInFamily(value),
                              selectedColor: Theme.of(context).accentColor,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 15),

                    ////
                    MaterialButton(
                      color: BUTTON_COLOR,
                      onPressed: () {
                        if (_formController.currentState.validate()) {
                          registerControler.registerUser();
                        }
                      },
                      child: Text(
                        'Kayıt Ol',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
