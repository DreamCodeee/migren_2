import 'package:flutter/material.dart';

class faydaliBilgiler extends StatelessWidget {
  List<String> notes = [
    " ✓ Stresten önemli ölçüde uzak durunuz",
    " ✓ Her gün kendiniz için bir şeyler yapınız",
    " ✓ Günde 7 saatten az, 9 saatten fazla uyumayınız",
    " ✓ Günde 2-2,5 litre su tüketiniz",
    " ✓ Taze meyve ve sebze, taze balık, et tüketiniz ve dengeli besleniniz",
    " ✓ Kafein içeren gıdalar ve fazla çay tüketiminden mümkün olduğunca kaçınınız",
    " ✓ Her gün düzenli olarak yemek yemeye, öğün atlamamaya özen gösteriniz",
    " ✓ Günde 30-45 dakikalık yürüyüş yapınız",
    " ✓ Sigara kullanımından kaçınınız",
    " ✓ Alkol kullanımından kaçınınız",
    " ✓ Parfüm ve sigara dumanı gibi yoğun kokulara maruz kalmayınız",
    " ✓ Lodoslu havalarda dikkat ediniz",
    " ✓ Klimalı ve kapalı ortamlarda uzun süre bulunmayınız",
    " ✓ Yazın güneş ışınlarının dik olarak geldiği saatlerde çok fazla dışarıda kalmayınız, mutlaka şapka ve güneş gözlüğü kullanınız.",
    " ✓ Yüksek sesten uzak durunuz",
    " ✓ Yoğun ışıktan uzak durunuz",
    " ✓ Yağlı ve baharatlı yiyeceklerden uzak durunuz",
    " ✓ Her türlü sakatat, salam, sosis, pastırma, sucuk uzak durunuz",
    " ✓ Karides veya midye gibi bazı deniz ürünlerinden uzak durunuz",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Faydalı Bilgiler"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: ListTile(
                title: Text(
                  notes[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
