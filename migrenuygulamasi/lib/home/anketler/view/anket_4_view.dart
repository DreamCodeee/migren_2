import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:migrenuygulamasi/home/anketler/controller/anket_4_controller.dart';
import 'package:migrenuygulamasi/home/anketler/view/anket_5_view.dart';

class AnketFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnketFourController>(
      init: AnketFourController(),
      builder: (anketController) {
        return Scaffold(
            appBar: AppBar(
              title: Text('UYKUSUZLUK ŞİDDETİ İNDEKSİ'),
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
                          "1-Lütfen şu andaki (örn., son 2 hafta içinde) uykusuzluk probleminizin / problemlerinizin şiddetini değerlendiriniz. ",
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
                          '1a-Uykuya dalmakta güçlük;',
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
                              'Hiç',
                              'Hafif',
                              'Orta',
                              'Şiddetli',
                              'Çok Şiddetli',
                            ],
                            buttonValues: [
                              '1',
                              '2',
                              '3',
                              '4',
                              '5',
                            ],
                            buttonTextStyle: ButtonTextStyle(selectedColor: Colors.white, unSelectedColor: Colors.purple, textStyle: TextStyle(fontSize: 16)),
                            radioButtonValue: (value) {
                              anketController.setQuestionOne(value);
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
                            anketController.a1 == null || anketController.a1.length == 0
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
                          '1b-Uykuyu sürdürmekte güçlük;',
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
                              'Hiç',
                              'Hafif',
                              'Orta',
                              'Şiddetli',
                              'Çok Şiddetli',
                            ],
                            buttonValues: [
                              '1',
                              '2',
                              '3',
                              '4',
                              '5',
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
                          '1c-Çok erken uyanma problemi ',
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
                              'Hiç',
                              'Hafif',
                              'Orta',
                              'Şiddetli',
                              'Çok Şiddetli',
                            ],
                            buttonValues: [
                              '1',
                              '2',
                              '3',
                              '4',
                              '5',
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '2-Son zamanlardaki uyku düzeninizden ne kadar memnunsunuz/ memnuniyetsizsiniz? ',
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
                              'Çok memnun',
                              'Memnun',
                              'Nötr',
                              'Memnun değil ',
                              'Hiç memnun değil',
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
                          "3-Uyku probleminizin gün içindeki işlevselliğinizi (örn., gün içinde tükenmişlik, işte/günlük uğraşlarda çalışma potansiyeli, konsantrasyon, hafıza, duygu durum, vb.) ne ölçüde engellediğini düşünüyorsunuz?",
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
                              'Kesinlikle engelleyici değil',
                              'Biraz engelleyici',
                              'Oldukça engelleyici ',
                              'Çok engelleyici ',
                              'Çok fazla engelleyici',
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
                          "4-Yaşam kalitenizin bozulması anlamında uyku probleminizin başkaları tarafından ne kadar fark edilebildiğini düşünüyorsunuz?",
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
                              'Kesinlikle fark edilemez ',
                              'Biraz fark edilebilir',
                              'Oldukça fark edilebilir ',
                              'Çok fark edilebilir ',
                              'Çok fark edilebilir',
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
                          "5-Son zamanlardaki uyku probleminiz sizi ne kadar endişelendiriyor/strese sokuyor?",
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
                              'Kesinlikle endişelendirmiyor ',
                              'Biraz endişelendiriyor',
                              'Oldukça endişelendiriyor ',
                              'Çok endişelendiriyor ',
                              'Çok endişelendiriyor',
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
