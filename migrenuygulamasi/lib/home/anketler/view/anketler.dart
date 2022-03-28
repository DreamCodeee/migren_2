import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:migrenuygulamasi/home/anketler/controller/anketler_controller.dart';
import 'package:migrenuygulamasi/home/anketler/view/anket_2_view.dart';
import 'package:migrenuygulamasi/home/anketler/view/anket_4_view.dart';
import 'package:migrenuygulamasi/home/anketler/view/anket_5_view.dart';
import 'package:migrenuygulamasi/home_controller.dart';

import 'anket_3_view.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class Anketler extends StatefulWidget {
  @override
  State<Anketler> createState() => _AnketlerState();
}

class _AnketlerState extends State<Anketler> {
  //var anket1;
  List<dynamic> anket1;
  List<dynamic> anket2;
  List<dynamic> anket3;
  List<dynamic> anket4;
  List<dynamic> anket5;
  bool isLoading = false;

  final Stream<QuerySnapshot> anketlerStream = FirebaseFirestore.instance
      .collection('anketler')
      .where('user_id', isEqualTo: auth.currentUser.uid)
      .snapshots();

  @override
  initState() {
    getData();
    super.initState();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    await FirebaseFirestore.instance
        .collection('anketler')
        .doc(auth.currentUser.uid)
        .get()
        .then((DocumentSnapshot<Map<String, dynamic>> value) {
      print('GELEN DEGER === ' + value.data()['anketler_5'].toString());
      anket1 = value.data()['anketler_1'];
      anket2 = value.data()['anketler_2'];
      anket3 = value.data()['anketler_3'];
      anket4 = value.data()['anketler_4'];
      anket5 = value.data()['anketler_5'];
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnketController>(
      init: AnketController(),
      builder: (anketController) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Anketler'),
            leading: IconButton(
                onPressed: () {
                  HomeController hc = Get.put(HomeController());
                  hc.getData();
                  Get.back();
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                )),
          ),
          body: isLoading == true
              ? Center(child: CircularProgressIndicator())
              : ListView(shrinkWrap: true, children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Container(
                            width: 400,
                            height: 60,
                            margin: EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              color: Colors.purple,
                              minWidth: MediaQuery.of(context).size.width,
                              onPressed: () => Get.to(() => AnketOne())
                                  .then((value) => getData()),
                              child: anket1.isNotEmpty
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.check),
                                        Text(
                                          'Anket 1',
                                          style: TextStyle(fontSize: 20),
                                        )
                                      ],
                                    )
                                  : Text(
                                      'Anket 1',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            width: 400,
                            height: 60,
                            margin: EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              onPressed: () => Get.to(() => AnketTwo())
                                  .then((value) => getData()),
                              minWidth: MediaQuery.of(context).size.width,
                              color: Colors.purple,
                              child: anket2.isNotEmpty
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.check),
                                        Text(
                                          'Anket 2',
                                          style: TextStyle(fontSize: 20),
                                        )
                                      ],
                                    )
                                  : Text(
                                      'Anket 2',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            width: 400,
                            height: 60,
                            margin: EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              onPressed: () => Get.to(() => AnketThree())
                                  .then((value) => getData()),
                              minWidth: MediaQuery.of(context).size.width,
                              color: Colors.purple,
                              child: anket3.isNotEmpty
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.check),
                                        Text(
                                          'Anket 3',
                                          style: TextStyle(fontSize: 20),
                                        )
                                      ],
                                    )
                                  : Text(
                                      'Anket 3',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            width: 400,
                            height: 60,
                            margin: EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              onPressed: () => Get.to(() => AnketFour())
                                  .then((value) => getData()),
                              minWidth: MediaQuery.of(context).size.width,
                              color: Colors.purple,
                              child: anket4.isNotEmpty
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.check),
                                        Text(
                                          'Anket 4',
                                          style: TextStyle(fontSize: 20),
                                        )
                                      ],
                                    )
                                  : Text(
                                      'Anket 4',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            width: 400,
                            height: 60,
                            margin: EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              onPressed: () => Get.to(() => AnketFive())
                                  .then((value) => getData()),
                              minWidth: MediaQuery.of(context).size.width,
                              color: Colors.purple,
                              child: anket5.isNotEmpty
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.check),
                                        Text(
                                          'Anket 5',
                                          style: TextStyle(fontSize: 20),
                                        )
                                      ],
                                    )
                                  : Text(
                                      'Anket 5',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
        );
      },
    );
  }
}

class AnketOne extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnketController>(
      init: AnketController(),
      builder: (anketController) {
        print(anketController.a1);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'MİGRENE BAĞLI İŞ KAYBI DEĞERLENDİRME ÖLÇEĞİ',
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '1. Son 3 ay içinde baş ağrıları nedeniyle kaç gün işe veya okula gidemediniz?',
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
                            anketController.setQuestionOne(value);
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      anketController.a1 == null ||
                              anketController.a1.length == 0
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
                        '2. Son 3 ay içinde baş ağrıları nedeniyle işteki veya okuldaki verimliliğiniz yarı yarıya veya daha fazla azaldığı gün sayısı nedir?',
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '3. Son 3 ay içinde baş ağrıları nedeniyle kaç gün ev işlerini yapamadınız?',
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
                            anketController.setQuestionThree(value);
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

                ///
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '4. Son 3 ay içinde baş ağrıları nedeniyle ev işlerindeki verimliliğiniz yarı yarıya veya daha fazla azaldığı gün sayısı nedir?',
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '5. Son 3 ay içinde baş ağrıları nedeniyle kaç gün ailenize, sosyal yaşamınıza veya boş vakitlerinizde yaptığınız faaliyetlere zaman ayıramadınız)',
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
                            anketController.setQuestionFive(value);
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '6. Son 3 ay içinde kaç gün baş ağrınız oldu?',
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
      },
    );
  }
}
