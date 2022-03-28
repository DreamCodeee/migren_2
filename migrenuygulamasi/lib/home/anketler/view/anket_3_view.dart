import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:migrenuygulamasi/home/anketler/controller/anket_3_controller.dart';

class AnketThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnketThreeController>(
        init: AnketThreeController(),
        builder: (anketController) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'ULUSLARARASI FİZİKSEL AKTİVİTE ANKETİ KISA FORM',
                textAlign: TextAlign.center,
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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '1-Son bir hafta içinde kaç gün ağır kaldırma, kazma, aerobik, basketbol, futbol veya hızlı bisiklet çevirme gibi şiddetli bedensel güç gerektiren faaliyetlerden yaptınız?',
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
                              defaultSelected: anketController.a1 == null
                                  ? null
                                  : anketController.a1,
                              buttonLables: [
                                'Hiç Yapmadım',
                                '1',
                                '2',
                                '3',
                                '4',
                                '5',
                                '6',
                                '7',
                              ],
                              buttonValues: [
                                '0',
                                '1',
                                '2',
                                '3',
                                '4',
                                '5',
                                '6',
                                '7',
                              ],
                              buttonTextStyle: ButtonTextStyle(
                                  selectedColor: Colors.white,
                                  unSelectedColor: Colors.purple,
                                  textStyle: TextStyle(fontSize: 16)),
                              radioButtonValue: (value) {
                                anketController.setQuestionOne(value);
                              },
                              selectedColor: Theme.of(context).accentColor,
                            ),
                          ),
                          anketController.a1 == null ||
                                  anketController.a1.length == 0
                              ? Container()
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                  ),

                  ///
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '2- Bu günlerin birinde şiddetli fiziksel aktivite yaparak genellikle ne kadar zaman harcadınız? (dakika olarak belirtiniz)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: TextField(
                            onChanged: (value) {
                              anketController.setQuestionTwo(value);
                            },
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
                            anketController.a2 == null ||
                                    anketController.a2.length == 0
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

                  ///////////////////

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '3- Son bir hafta içinde kaç gün hafif yük taşıma, normal hızda bisiklet çevirme, halk oyunları, dans, bowling veya tenis gibi orta dereceli bedensel güç gerektiren faaliyetlerden yaptınız? (Yürüme hariç.) sdsfs',
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
                              defaultSelected: anketController.a3 == null
                                  ? null
                                  : anketController.a3,
                              buttonLables: [
                                'Hiç Yapmadım',
                                '1',
                                '2',
                                '3',
                                '4',
                                '5',
                                '6',
                                '7',
                              ],
                              buttonValues: [
                                '0',
                                '1',
                                '2',
                                '3',
                                '4',
                                '5',
                                '6',
                                '7',
                              ],
                              buttonTextStyle: ButtonTextStyle(
                                  selectedColor: Colors.white,
                                  unSelectedColor: Colors.purple,
                                  textStyle: TextStyle(fontSize: 16)),
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
                              anketController.a3 == null ||
                                      anketController.a3.length == 0
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
                  ),

                  ////////////
                  ///
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '4- Bu günlerin birinde orta dereceli fiziksel aktivite yaparak genellikle ne kadar zaman harcadınız? (dakika olarak belirtiniz)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: TextField(
                            onChanged: (value) {
                              anketController.setQuestionFour(value);
                            },
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
                            anketController.a4 == null ||
                                    anketController.a4.length == 0
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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '5- Geçen 7 gün içerisinde, bir seferde en az 10 dakika yürüdüğünüz gün sayısı kaçtır?',
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
                              defaultSelected: anketController.a5 == null
                                  ? null
                                  : anketController.a5,
                              buttonLables: [
                                'Hiç Yapmadım',
                                '1',
                                '2',
                                '3',
                                '4',
                                '5',
                                '6',
                                '7',
                              ],
                              buttonValues: [
                                '0',
                                '1',
                                '2',
                                '3',
                                '4',
                                '5',
                                '6',
                                '7',
                              ],
                              buttonTextStyle: ButtonTextStyle(
                                  selectedColor: Colors.white,
                                  unSelectedColor: Colors.purple,
                                  textStyle: TextStyle(fontSize: 16)),
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
                              anketController.a5 == null ||
                                      anketController.a5.length == 0
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
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '6- Bu günlerden birinde yürüyerek genellikle ne kadar zaman geçirdiniz? (dakika olarak belirtiniz)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: TextField(
                            onChanged: (value) {
                              anketController.setQuestionSix(value);
                            },
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
                            anketController.a6 == null ||
                                    anketController.a6.length == 0
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
            ),
          );
        });
  }
}
