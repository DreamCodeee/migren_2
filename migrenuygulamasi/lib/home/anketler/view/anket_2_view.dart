import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:migrenuygulamasi/home/anketler/controller/anket_2_controller.dart';
import 'package:migrenuygulamasi/home/anketler/view/anket_3_view.dart';

class AnketTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnketTwoController>(
      init: AnketTwoController(),
      builder: (anketController) {
        return Scaffold(
            appBar: AppBar(
              title: Text('SF-12 YAŞAM KALİTESİ'),
            ),
            body: Container(
              width: Get.size.width,
              height: Get.size.height,
              child: PageView(
                controller: anketController.pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '1- Genelde, sağlığınız;',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                        MediaQuery.removePadding(
                          context: Get.context,
                          removeBottom: true,
                          removeTop: true,
                          child: CustomRadioButton(
                            horizontal: true,
                            elevation: 0,
                            absoluteZeroSpacing: true,
                            unSelectedColor: Theme.of(context).canvasColor,
                            defaultSelected: anketController.a1 == null ? null : anketController.a1,
                            buttonLables: [
                              'Mükemmel',
                              'Oldukça iyi',
                              'İyi',
                              'Orta',
                              'Kötü',
                            ],
                            buttonValues: [
                              '5',
                              '4',
                              '3',
                              '2',
                              '1',
                            ],
                            buttonTextStyle: ButtonTextStyle(selectedColor: Colors.white, unSelectedColor: Colors.purple, textStyle: TextStyle(fontSize: 16)),
                            radioButtonValue: (value) {
                              anketController.setQuestionOne(value);
                            },
                            selectedColor: Theme.of(context).accentColor,
                          ),
                        ),
                        anketController.a1 == null || anketController.a1.length == 0
                            ? Container()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Spacer(),
                                  TextButton(
                                    onPressed: () {
                                      anketController.setNextPage();
                                    },
                                    child: Text('Sonraki'),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '• Aşağıdaki maddeler, tipik bir gün sırasında yapabileceğiniz etkinlikler hakkındadır. Sağlığınız, bu etkinlikleri yaparken sizi kısıtlıyor mu? Eğer kısıtlıyorsa, ne kadar?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                anketController.setPreviousPage();
                              },
                              child: Text('Önceki'),
                            ),
                            TextButton(
                              onPressed: () {
                                anketController.setNextPage();
                              },
                              child: Text('Sonraki'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '2- Orta düzeydeki etkinlikler sırasında; örneğin: Masayı çekerken, elektrik süpürgesi kullanırken, yürüyüş yaparken sağlığınız sizi ne ölçüde kısıtlıyor?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                        MediaQuery.removePadding(
                          context: Get.context,
                          removeBottom: true,
                          removeTop: true,
                          child: CustomRadioButton(
                            horizontal: true,
                            elevation: 0,
                            absoluteZeroSpacing: true,
                            unSelectedColor: Theme.of(context).canvasColor,
                            defaultSelected: anketController.a2 == null ? null : anketController.a2,
                            buttonLables: [
                              'Çok kısıtlıyor',
                              'Az kısıtlıyor',
                              'Hiç kısıtlıyor',
                            ],
                            buttonValues: [
                              '1',
                              '2',
                              '3',
                            ],
                            buttonTextStyle: ButtonTextStyle(selectedColor: Colors.white, unSelectedColor: Colors.purple, textStyle: TextStyle(fontSize: 16)),
                            radioButtonValue: (value) {
                              anketController.setQuestionTwo(value);
                            },
                            selectedColor: Theme.of(context).accentColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                anketController.setPreviousPage();
                              },
                              child: Text('Önceki'),
                            ),
                            anketController.a2 == null || anketController.a2.length == 0
                                ? Container()
                                : TextButton(
                                    onPressed: () {
                                      anketController.setNextPage();
                                    },
                                    child: Text('Sonraki'),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '3- Merdiven çıkarken sağlığınız sizi ne ölçüde kısıtlıyor?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                        MediaQuery.removePadding(
                          context: Get.context,
                          removeBottom: true,
                          removeTop: true,
                          child: CustomRadioButton(
                            horizontal: true,
                            elevation: 0,
                            absoluteZeroSpacing: true,
                            unSelectedColor: Theme.of(context).canvasColor,
                            defaultSelected: anketController.a3 == null ? null : anketController.a3,
                            buttonLables: [
                              'Çok kısıtlıyor',
                              'Az kısıtlıyor',
                              'Hiç kısıtlıyor',
                            ],
                            buttonValues: [
                              '1',
                              '2',
                              '3',
                            ],
                            buttonTextStyle: ButtonTextStyle(selectedColor: Colors.white, unSelectedColor: Colors.purple, textStyle: TextStyle(fontSize: 16)),
                            radioButtonValue: (value) {
                              anketController.setQuestionThree(value);
                            },
                            selectedColor: Theme.of(context).accentColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                anketController.setPreviousPage();
                              },
                              child: Text('Önceki'),
                            ),
                            anketController.a3 == null || anketController.a3.length == 0
                                ? Container()
                                : TextButton(
                                    onPressed: () {
                                      anketController.setNextPage();
                                    },
                                    child: Text('Sonraki'),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  ///
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '4- Son dört hafta boyunca, fiziksel sağlığınıza bağlı olarak beklenenden daha az iş yaptığınız oldu mu?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                        MediaQuery.removePadding(
                          context: Get.context,
                          removeBottom: true,
                          removeTop: true,
                          child: CustomRadioButton(
                            horizontal: true,
                            elevation: 0,
                            absoluteZeroSpacing: true,
                            unSelectedColor: Theme.of(context).canvasColor,
                            defaultSelected: anketController.a4 == null ? null : anketController.a4,
                            buttonLables: [
                              'Evet',
                              'Hayır',
                            ],
                            buttonValues: [
                              '1',
                              '2',
                            ],
                            buttonTextStyle: ButtonTextStyle(selectedColor: Colors.white, unSelectedColor: Colors.purple, textStyle: TextStyle(fontSize: 16)),
                            radioButtonValue: (value) {
                              anketController.setQuestionFour(value);
                            },
                            selectedColor: Theme.of(context).accentColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                anketController.setPreviousPage();
                              },
                              child: Text('Önceki'),
                            ),
                            anketController.a4 == null || anketController.a4.length == 0
                                ? Container()
                                : TextButton(
                                    onPressed: () {
                                      anketController.setNextPage();
                                    },
                                    child: Text('Sonraki'),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '5- Son dört hafta boyunca, fiziksel sağlığınıza bağlı olarak, düzenli etkinlikleriniz veya işinizde kısıtlandığınız oldu mu?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                        MediaQuery.removePadding(
                          context: Get.context,
                          removeBottom: true,
                          removeTop: true,
                          child: CustomRadioButton(
                            horizontal: true,
                            elevation: 0,
                            absoluteZeroSpacing: true,
                            unSelectedColor: Theme.of(context).canvasColor,
                            defaultSelected: anketController.a5 == null ? null : anketController.a5,
                            buttonLables: [
                              'Evet',
                              'Hayır',
                            ],
                            buttonValues: [
                              '1',
                              '2',
                            ],
                            buttonTextStyle: ButtonTextStyle(selectedColor: Colors.white, unSelectedColor: Colors.purple, textStyle: TextStyle(fontSize: 16)),
                            radioButtonValue: (value) {
                              anketController.setQuestionFive(value);
                            },
                            selectedColor: Theme.of(context).accentColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                anketController.setPreviousPage();
                              },
                              child: Text('Önceki'),
                            ),
                            anketController.a5 == null || anketController.a5.length == 0
                                ? Container()
                                : TextButton(
                                    onPressed: () {
                                      anketController.setNextPage();
                                    },
                                    child: Text('Sonraki'),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '6- Son dört hafta boyunca, kendinizi depresif (çökkün) veya kaygılı hissetmek gibi duygusal bir sorun sonucunda beklenenden daha az iş yaptığınız oldu mu?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                        MediaQuery.removePadding(
                          context: Get.context,
                          removeBottom: true,
                          removeTop: true,
                          child: CustomRadioButton(
                            horizontal: true,
                            elevation: 0,
                            absoluteZeroSpacing: true,
                            unSelectedColor: Theme.of(context).canvasColor,
                            defaultSelected: anketController.a6 == null ? null : anketController.a6,
                            buttonLables: [
                              'Evet',
                              'Hayır',
                            ],
                            buttonValues: [
                              '1',
                              '2',
                            ],
                            buttonTextStyle: ButtonTextStyle(selectedColor: Colors.white, unSelectedColor: Colors.purple, textStyle: TextStyle(fontSize: 16)),
                            radioButtonValue: (value) {
                              anketController.setQuestionSix(value);
                            },
                            selectedColor: Theme.of(context).accentColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                anketController.setPreviousPage();
                              },
                              child: Text('Önceki'),
                            ),
                            anketController.a6 == null || anketController.a6.length == 0
                                ? Container()
                                : TextButton(
                                    onPressed: () {
                                      anketController.setNextPage();
                                    },
                                    child: Text('Sonraki'),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '7- Son dört hafta boyunca, kendinizi depresif (çökkün) veya kaygılı hissetmek gibi duygusal bir sorun sonucunda düzenli etkinlikleriniz veya işinizde her zamanki kadar dikkatli olamadığınız oldu mu?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                        MediaQuery.removePadding(
                          context: Get.context,
                          removeBottom: true,
                          removeTop: true,
                          child: CustomRadioButton(
                            horizontal: true,
                            elevation: 0,
                            absoluteZeroSpacing: true,
                            unSelectedColor: Theme.of(context).canvasColor,
                            defaultSelected: anketController.a7 == null ? null : anketController.a7,
                            buttonLables: [
                              'Evet',
                              'Hayır',
                            ],
                            buttonValues: [
                              '1',
                              '2',
                            ],
                            buttonTextStyle: ButtonTextStyle(selectedColor: Colors.white, unSelectedColor: Colors.purple, textStyle: TextStyle(fontSize: 16)),
                            radioButtonValue: (value) {
                              anketController.setQuestionSeven(value);
                            },
                            selectedColor: Theme.of(context).accentColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                anketController.setPreviousPage();
                              },
                              child: Text('Önceki'),
                            ),
                            anketController.a7 == null || anketController.a7.length == 0
                                ? Container()
                                : TextButton(
                                    onPressed: () {
                                      anketController.setNextPage();
                                    },
                                    child: Text('Sonraki'),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '8- Son dört hafta boyunca, evde ve işte ne ölçüde ağrı normal işlerinize engel oldu?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                        MediaQuery.removePadding(
                          context: Get.context,
                          removeBottom: true,
                          removeTop: true,
                          child: CustomRadioButton(
                            horizontal: true,
                            elevation: 0,
                            absoluteZeroSpacing: true,
                            unSelectedColor: Theme.of(context).canvasColor,
                            defaultSelected: anketController.a8 == null ? null : anketController.a8,
                            buttonLables: [
                              'Hiç',
                              'Hafif',
                              'Orta',
                              'Oldukça fazla',
                              'Aşırı derecede',
                            ],
                            buttonValues: [
                              '5',
                              '4',
                              '3',
                              '2',
                              '1',
                            ],
                            buttonTextStyle: ButtonTextStyle(selectedColor: Colors.white, unSelectedColor: Colors.purple, textStyle: TextStyle(fontSize: 16)),
                            radioButtonValue: (value) {
                              anketController.setQuestionEight(value);
                            },
                            selectedColor: Theme.of(context).accentColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                anketController.setPreviousPage();
                              },
                              child: Text('Önceki'),
                            ),
                            anketController.a8 == null || anketController.a8.length == 0
                                ? Container()
                                : TextButton(
                                    onPressed: () {
                                      anketController.setNextPage();
                                    },
                                    child: Text('Sonraki'),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '•	Aşağıdaki sorular son dört haftada kendinizi nasıl hissettiğiniz ve işlerin nasıl gittiği ile ilgilidir. Her bir soru için size en yakın seçeneği işaretleyiniz.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                anketController.setPreviousPage();
                              },
                              child: Text('Önceki'),
                            ),
                            TextButton(
                              onPressed: () {
                                anketController.setNextPage();
                              },
                              child: Text('Sonraki'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '9-Son dört hafta boyunca ne kadar sıklıkla kendinizi sakin ve huzurlu hissettiniz?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                        MediaQuery.removePadding(
                          context: Get.context,
                          removeBottom: true,
                          removeTop: true,
                          child: CustomRadioButton(
                            horizontal: true,
                            elevation: 0,
                            absoluteZeroSpacing: true,
                            unSelectedColor: Theme.of(context).canvasColor,
                            defaultSelected: anketController.a9 == null ? null : anketController.a9,
                            buttonLables: ['Her zaman', 'Çoğu zaman', 'Ara sıra', 'Bazen', 'Çok az bir zaman', 'Hiçbir zaman'],
                            buttonValues: [
                              '6',
                              '5',
                              '4',
                              '3',
                              '2',
                              '1',
                            ],
                            buttonTextStyle: ButtonTextStyle(selectedColor: Colors.white, unSelectedColor: Colors.purple, textStyle: TextStyle(fontSize: 16)),
                            radioButtonValue: (value) {
                              anketController.setQuestionNine(value);
                            },
                            selectedColor: Theme.of(context).accentColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                anketController.setPreviousPage();
                              },
                              child: Text('Önceki'),
                            ),
                            anketController.a9 == null || anketController.a9.length == 0
                                ? Container()
                                : TextButton(
                                    onPressed: () {
                                      anketController.setNextPage();
                                    },
                                    child: Text('Sonraki'),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '10- Son dört hafta boyunca ne kadar sıklıkla enerji doluydunuz?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                        MediaQuery.removePadding(
                          context: Get.context,
                          removeBottom: true,
                          removeTop: true,
                          child: CustomRadioButton(
                            horizontal: true,
                            elevation: 0,
                            absoluteZeroSpacing: true,
                            unSelectedColor: Theme.of(context).canvasColor,
                            defaultSelected: anketController.a10 == null ? null : anketController.a10,
                            buttonLables: ['Her zaman', 'Çoğu zaman', 'Ara sıra', 'Bazen', 'Çok az bir zaman', 'Hiçbir zaman'],
                            buttonValues: [
                              '6',
                              '5',
                              '4',
                              '3',
                              '2',
                              '1',
                            ],
                            buttonTextStyle: ButtonTextStyle(selectedColor: Colors.white, unSelectedColor: Colors.purple, textStyle: TextStyle(fontSize: 16)),
                            radioButtonValue: (value) {
                              anketController.setQuestionTen(value);
                            },
                            selectedColor: Theme.of(context).accentColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                anketController.setPreviousPage();
                              },
                              child: Text('Önceki'),
                            ),
                            anketController.a10 == null || anketController.a10.length == 0
                                ? Container()
                                : TextButton(
                                    onPressed: () {
                                      anketController.setNextPage();
                                    },
                                    child: Text('Sonraki'),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '11- Son dört hafta boyunca ne kadar sıklıkla kendinizi çökkün hissettiniz?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                        MediaQuery.removePadding(
                          context: Get.context,
                          removeBottom: true,
                          removeTop: true,
                          child: CustomRadioButton(
                            horizontal: true,
                            elevation: 0,
                            absoluteZeroSpacing: true,
                            unSelectedColor: Theme.of(context).canvasColor,
                            defaultSelected: anketController.a11 == null ? null : anketController.a11,
                            buttonLables: ['Her zaman', 'Çoğu zaman', 'Ara sıra', 'Bazen', 'Çok az bir zaman', 'Hiçbir zaman'],
                            buttonValues: [
                              '6',
                              '5',
                              '4',
                              '3',
                              '2',
                              '1',
                            ],
                            buttonTextStyle: ButtonTextStyle(selectedColor: Colors.white, unSelectedColor: Colors.purple, textStyle: TextStyle(fontSize: 16)),
                            radioButtonValue: (value) {
                              anketController.setQuestionEleven(value);
                            },
                            selectedColor: Theme.of(context).accentColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                anketController.setPreviousPage();
                              },
                              child: Text('Önceki'),
                            ),
                            anketController.a11 == null || anketController.a11.length == 0
                                ? Container()
                                : TextButton(
                                    onPressed: () {
                                      anketController.setNextPage();
                                    },
                                    child: Text('Sonraki'),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '12- Son dört hafta boyunca ne kadar sıklıkla fiziksel sağlığınız veya duygusal sorunlarınız, arkadaş veya akraba ziyareti gibi sosyal etkinliklerinizi olumsuz etkiledi?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                        MediaQuery.removePadding(
                          context: Get.context,
                          removeBottom: true,
                          removeTop: true,
                          child: CustomRadioButton(
                            horizontal: true,
                            elevation: 0,
                            absoluteZeroSpacing: true,
                            unSelectedColor: Theme.of(context).canvasColor,
                            defaultSelected: anketController.a12 == null ? null : anketController.a12,
                            buttonLables: ['Her zaman', 'Çoğu zaman', 'Ara sıra', 'Bazen', 'Çok az bir zaman', 'Hiçbir zaman'],
                            buttonValues: [
                              '6',
                              '5',
                              '4',
                              '3',
                              '2',
                              '1',
                            ],
                            buttonTextStyle: ButtonTextStyle(selectedColor: Colors.white, unSelectedColor: Colors.purple, textStyle: TextStyle(fontSize: 16)),
                            radioButtonValue: (value) {
                              anketController.setQuestionTwelve(value);
                            },
                            selectedColor: Theme.of(context).accentColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                anketController.setPreviousPage();
                              },
                              child: Text('Önceki'),
                            ),
                            anketController.a12 == null || anketController.a12.length == 0
                                ? Container()
                                : TextButton(
                                    onPressed: () {
                                      anketController.calculateAnketOne();
                                    },
                                    child: Text('Anket Sonucu'),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
                //
              ),
            ));
      },
    );
  }
}
