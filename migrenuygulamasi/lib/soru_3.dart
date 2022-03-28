import 'package:flutter/material.dart';

class UcuncuSoru extends StatelessWidget {
  List<String> notes = [
    "  Migren zaman zaman ataklar yapan, başın genellikle bir tarafında zonklayıcı bir ağrıyla birlikte bulantı, kusma, karın ağrısı, ishal, görme bozuklukları, baş dönmesi bulunabilen bir ağrı çeşididir. Başın bir tarafını tutması kesin bir kural değildir. Başın yarısının ağrıması bütün migren vakalarının % 44’ünde görülür ve % 22 oranında bütün başı ağrıtır. Başın diğer bölgelerinin ağrıdığı da olur. Önemli olan eşlik eden belirtilerin bulunmasıdır. Migren genç yaşlarda çok daha sık görülür. Bir ila otuz yaş arasında daha fazladır. Kadınları erkeklerden üç kat daha fazla tutar. Genetik bir geçiş tam olarak gösterilmemişse de, aile bireylerinin birinde migren olan bir şahsın hastalığa yakalanması daha muhtemeldir. Baş ağrıları arasında oldukça büyük oran teşkil eder. Primer başarılarının yüzde 40-50’si migrendir.",
    "  Egzersizin tedavi edici etkileri iyi kanıtlanmıştır. Düzenli egzersizin, genel sağlık iyileştirmekte ve yüksek kan basıncı, diyabet, depresyon ve obezite gibi hastalıklara yakalanma riskini azaltmaktır. En önemli faydaları da, stresi azaltarak kolesterol düzeylerini düşürür, uyku kalitesinin artırılması ve mutluluk hormonu ürettiği ispatlanmıştır. İnsanlarda genel olarak egzersiz migrenin tetikleyicisi olarak belirtilir, ancak yapılan araştırmalar yavaş tempoda yapılan aerobik egzersizin migren üzerinde tedavi edici bir etkiye sahip olduğunu göstermiştir. Ancak bu çalışmada yüksek şiddetli egzersizin migren atağını tetiklediğinde ortaya koymuştur.",
    "  İsveç’teki Göteborg Üniversitesi'nden bir grup uzmanın ''Cephalalgia'' dergisinde yayımlanan araştırmasında, egzersizin, günlük ilaç kullanımından fayda sağlayamayan ya da ilaç kullanmayı sevmeyen migren hastaları için alternatif bir tedavi yöntemi olduğunu ortaya koydu. Yaşları 18-65 arasında değişen ve ayda iki ila sekiz kez migren kaynaklı baş ağrısı problemi yaşayan bir grup kadını inceleyen uzmanlar, katılımcıların bir kısmını haftada üç kez 40'ar dakikalık egzersiz için kondisyon bisikletine çıkardı, bir kısmına standart rahatlama terapisi uyguladı, diğerlerinde ise günlük ilaç tedavisine devam etti. Bu çalışmada üç gruptaki kadınların da migren ataklarında büyük ölçüde azalma yaşandığını belirten araştırma ekibinden Dr. Emma Varkey, migreni tedavi etmekte en sıklıkla kullanılan ilaç olan ''Topiramate'' verilen katılımcılarla, egzersiz ve rahatlama yöntemlerinin uygulandığı kadınlarda benzer oranda iyileşme görülmesinin son derece şaşırtıcı olduğunu kaydetti.",
    "  İlaç içermeyen yöntemleri tercih eden katılımcılarda hiçbir yan etki görülmediğini, özellikle egzersiz yapanlarda oksijen alımındaki artışa bağlı olarak pozitif etkiler gözlemlendiğini belirten Varkey, ilaç kullananların yüzde 33'ünde ise uyuşukluk, karıncalanma, yorgunluk, depresyon ve baş dönmesi gibi bir dizi yan etki tespit edildiğini ifade etti. Varkey, araştırmanın, egzersizin migren tedavisinde ilaçla kıyaslandığında hiç de azımsanmayacak olumlu etkileri olduğunu ortaya koyduğunu belirtti.Sonuç olarak, daha önceki çalışmalarda hafif düzenli aerobik egzersizin migren rahatsızlığı olanlar için faydalarını söylemiştik. Bu egzersizlerin özellikle yavaş tempolu koşu jogging, yavaş tempolu yüzmek, rahat ortamda dans etmek, bisiklete binmek, tempolu yürüyüş en ideal egzersiz olarak seçilebilir. Sizin en uygun egzersizlerin başında çok fazla yorucu olmayan rekabet ve gerilimden uzak egzersizleri seçmek gerekir. Bu egzersizler orta yoğunlukta, haftada 3-4 gün ve en az 30-40 dakika olmalıdır. Bu egzersizlerin etkisini 6-8 hafta sonra görmeye başlarsınız. İleri yaşlarda iseniz mutlaka doktor kontrolünden geçtikten sonra egzersiz yapın. Son olarak egzersiz, migren için iyi bir tedavi yöntemidir. Özellikle bol miktarda su tüketmek ve egzersiz yapmak, migreni bitirmese bile migren ataklarını büyük oranda azaltacaktır.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Migrenimde Egzersiz Neden Önemli?"),
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
