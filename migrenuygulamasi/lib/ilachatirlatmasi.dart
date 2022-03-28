import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class IlacHatirlatmasi extends StatefulWidget {
  @override
  _IlacHatirlatmasiState createState() => _IlacHatirlatmasiState();
}

class _IlacHatirlatmasiState extends State<IlacHatirlatmasi> {
  DateTime myDate;
  bool checkVal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İlaç Hatırlatma'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DateTimePicker(
                type: DateTimePickerType.dateTimeSeparate,
                dateMask: 'd/MM/yyyy',
                initialValue: DateTime.now().toString(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
                dateLabelText: 'Tarih',
                timeLabelText: "Saat",
                onChanged: (val) {
                  myDate = DateTime.parse(val);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: checkVal,
                    onChanged: (value) {
                      setState(() {
                        checkVal = value;
                      });
                    },
                  ),
                  Text('Her gün aynı saatte bildirim almak ister misiniz?')
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  notify();
                },
                child: Text("Uygula"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  notify() async {
    if (myDate == null) {
      setState(() {
        myDate = DateTime.now();
      });
    }

    if (checkVal == true) {
      setState(() {
        myDate = myDate.add(Duration(days: 1));
      });
      print('BİR GÜN SONRAA :.:  ' + myDate.toString());
    }

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 10,
          channelKey: 'basic_channel',
          title: 'İlaç Hatırlatma',
          body: 'Lütfen ilaçlarınızı içmeyi unutmayınız!'),
      schedule: NotificationCalendar.fromDate(
        date: myDate.add(
          Duration(minutes: 1),
        ),
        repeats: checkVal,
      ),
    );
  }
}
