import 'package:flutter/material.dart';

class IlkSoru extends StatelessWidget {
  List<String> notes = [
    " * Migren Rehberi uygulamasına giriş yapabilmek için ilk olarak kayıt sayfasından kayıt olabilmeniz gerekmektedir.",
    " * Kayıt olduktan sonra girmiş olduğunuz mail ve şifreniz ile giriş yapabilirsiniz.",
    " * Sizi karşılayan anasayfada sizi Baş Ağrısı Günlüğü, Egzersizler vb. kısımlar karşılamaktadır.",
    " * Baş Ağrısı Günlüğü kısmında belirli bazı ağrı ile alakalı kısımlar cevaplanmalıdır.",
    " * Ardından Egzersizler kısmında istediğiniz egzersiz videosunu seçip izleyebilirsiniz.",
    " * Anketler kısmında ise bazı sorulara cevap vererek migreminizin ne durumda olduğunu öğrenebilirsiniz.",
    " * İlaç Hatırlatması ile girmiş olduğunuz saat ve tarihte almanız gereken ilaçları alabilirsiniz.",
    " * Son olarak Faydalı Bilgiler kısmı ise size migren hakkında gerekli bazı bilgileri sunmaktadır.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Migren Rehberimi Nasıl Kullanabilirim?"),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: notes
            .map((note) => Container(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    note,
                    style: TextStyle(fontSize: 15),
                  ),
                ))
            .toList(),
      )),
    );
  }
}
