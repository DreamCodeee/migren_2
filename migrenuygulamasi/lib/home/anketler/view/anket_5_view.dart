import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:migrenuygulamasi/home/anketler/controller/anket_5_controller.dart';

class AnketFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnketFiveController>(
      init: AnketFiveController(),
      builder: (anketController) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                'HASTANE ANKSİYETE DEPRESYON ÖLÇEĞİ',
                maxLines: 2,
              ),
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
                          "Her maddeyi okuyun ve son birkaç gününüzü göz önünde bulundurarak nasıl hissettiğinizi en iyi ifade eden yanıtın yanındaki kutuyu işaretleyin. Yanıtınız için çok düşünmeyin, aklınıza ilk gelen yanıt en doğrusu olacaktır",
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
                          '1-Kendimi gergin “patlayacak gibi” hissediyorum',
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
                              'Çoğu zaman',
                              'Birçok zaman',
                              'Zaman zaman',
                              'bazen',
                              'Hiçbir zaman',
                            ],
                            buttonValues: [
                              '4',
                              '3',
                              '2',
                              '1',
                              '0',
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
                          '2- Eskiden zevk aldığım şeylerden halen zevk alıyorum ',
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
                              'Aynı eskisi kadar',
                              'Pek eskisi kadar değil',
                              'Yalnızca biraz eskisi kadar',
                              'Hiçbir zaman',
                            ],
                            buttonValues: [
                              '1',
                              '2',
                              '3',
                              '4',
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
                          '3- Sanki kötü bir şey olacakmış gibi bir korkuya kapılıyorum ',
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
                              'Kesinlikle öyle ve oldukça da şiddetli',
                              'Evet, ama çok da şiddetli değil',
                              'Biraz, ama beni pek endişelendirmiyor',
                              'Hayır, hiç de öyle değil',
                            ],
                            buttonValues: [
                              '3',
                              '2',
                              '1',
                              '0',
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
                          "4- Gülebiliyorum ve olayların komik tarafını görebiliyorum",
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
                              'Her zaman olduğu kadar',
                              'Şimdi pek o kadar değil',
                              'Kesinlikle o kadar değil',
                              'Artık hiç değil',
                            ],
                            buttonValues: [
                              '0',
                              '1',
                              '2',
                              '3',
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
                          "5-Aklımdan endişe verici düşünceler geçiyor",
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
                              'Çoğu zaman',
                              'Birçok zaman',
                              'Zaman zaman, çok sık değil ',
                              'Yalnızca bazen ',
                            ],
                            buttonValues: [
                              '3',
                              '2',
                              '1',
                              '0',
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
                          "6- Kendimi neşeli hissediyorum",
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
                              'Hiçbir zaman',
                              'Sık değil',
                              'Bazen ',
                              'Çoğu zaman',
                              'Çok fark edilebilir',
                            ],
                            buttonValues: [
                              '4',
                              '3',
                              '2',
                              '1',
                              '0',
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
                          "7- Rahat rahat oturabiliyorum ve kendimi rahat hissediyorum",
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
                              'Kesinlikle',
                              'Genellikle',
                              'Sık değil ',
                              'Hiçbir zaman ',
                            ],
                            buttonValues: [
                              '0',
                              '1',
                              '2',
                              '3',
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
                          "8-Kendimi sanki durgunlaşmış gibi hissediyorum",
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
                              'Hemen hemen her zaman',
                              'Çok sık',
                              'Bazen ',
                              'Hiçbir zaman ',
                            ],
                            buttonValues: [
                              '3',
                              '2',
                              '1',
                              '0',
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
                          "9- Sanki içim pır pır ediyormuş gibi bir tedirginliğe kapılıyorum",
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
                            buttonLables: [
                              'Hiçbir zaman',
                              'Bazen',
                              'Oldukça sık ',
                              'Çok sık ',
                            ],
                            buttonValues: [
                              '0',
                              '1',
                              '2',
                              '3',
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
                          "10- Dış görünüşüme ilgimi kaybettim",
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
                            buttonLables: [
                              'Kesinlikle',
                              'Gerektiği kadar özen göstermiyorum',
                              'Pek o kadar özen göstermeyebilirim',
                              'Her zamanki kadar özen gösteriyorum ',
                            ],
                            buttonValues: [
                              '3',
                              '2',
                              '1',
                              '0',
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
                          "11-Kendimi sanki hep bir şey yapmak zorundaymışım gibi husursuz hissediyorum",
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
                            buttonLables: [
                              'Gerçekten de çok fazla',
                              'Oldukça fazla',
                              'Çok fazla değil ',
                              'Hiç değil',
                            ],
                            buttonValues: [
                              '3',
                              '2',
                              '1',
                              '0',
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
                          "12- Olacakları zevkle bekliyorum",
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
                            buttonLables: [
                              'Her zaman olduğu kadar',
                              'Her zamankinden biraz daha az',
                              'Her zamankinden kesinlikle daha az',
                              'Hemen hemen hiç ',
                            ],
                            buttonValues: [
                              '0',
                              '1',
                              '2',
                              '3',
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
                          "13- Aniden panik duygusuna kapılıyorum",
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
                            defaultSelected: anketController.a13 == null ? null : anketController.a13,
                            buttonLables: [
                              'Gerçekten de çok sık',
                              'Oldukça sık',
                              'Çok sık değil ',
                              'Hiçbir zaman ',
                            ],
                            buttonValues: [
                              '0',
                              '1',
                              '2',
                              '3',
                            ],
                            buttonTextStyle: ButtonTextStyle(selectedColor: Colors.white, unSelectedColor: Colors.purple, textStyle: TextStyle(fontSize: 16)),
                            radioButtonValue: (value) {
                              anketController.setQuestionThirteen(value);
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
                            anketController.a13 == null || anketController.a13.length == 0
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
                          "14- İyi bir kitap, televizyon ya da radyo programından zevk alabiliyorum",
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
                            defaultSelected: anketController.a1 == null ? null : anketController.a14,
                            buttonLables: [
                              'Sıklıkla',
                              'Bazen',
                              'Pek sık değil ',
                              'Çok seyrek',
                            ],
                            buttonValues: [
                              '0',
                              '1',
                              '2',
                              '3',
                            ],
                            buttonTextStyle: ButtonTextStyle(selectedColor: Colors.white, unSelectedColor: Colors.purple, textStyle: TextStyle(fontSize: 16)),
                            radioButtonValue: (value) {
                              anketController.setQuestionFourteen(value);
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
                            anketController.a14 == null || anketController.a14.length == 0
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
