import 'package:firebase_app/core/widght/ButtonWidght.dart';
import 'package:firebase_app/core/widght/Spacer.dart';
import 'package:firebase_app/core/widght/textFromFieldRegister.dart';
import 'package:firebase_app/notify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TimeOfDay selectedTime = TimeOfDay.now();

  void _onTimeChanged(TimeOfDay newTime) {
    setState(() {
      selectedTime = newTime;
    });
  }

  final FlutterTts flutterTts = FlutterTts();

  Future<void> speak(String text) async {
    await flutterTts.setLanguage("ar-SA"); // اللغة العربية
    await flutterTts.setPitch(1.0); // طبقة الصوت
    await flutterTts.setSpeechRate(0.5); // سرعة القراءة
    await flutterTts.speak(text);
  }

  TextEditingController? controller_nameM = TextEditingController();

  TextEditingController? controller_Time = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              "madical",
              textAlign: TextAlign.center,
            ),
          ),
          TextFromFieldWidght(
            controller: controller_nameM,
          ),
          SpacerWidght(
            height: 20.h,
          ),
          TextFromFieldWidght(
            controller: controller_Time,
          ),
          SpacerWidght(
            height: 50.h,
          ),
          Text("الوقت المختار: ${selectedTime.format(context)}",
              style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                showPicker(
                  context: context,
                  value: Time(
                      hour: selectedTime.hour, minute: selectedTime.minute),
                  onChange: _onTimeChanged,
                  minuteInterval: TimePickerInterval.FIVE,
                  is24HrFormat: true,
                ),
              );
            },
            child: Text("اختيار الوقت"),
          ),
          SpacerWidght(
            height: 50.h,
          ),
          ElevatedButtonWidght(
            onPressed: () async {
              await Notify.scheduleNotification(time: selectedTime);
              Notify.showTestNotification();
            },
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => speak("يرجى تناول دواء السكري يا ابو فادي"),
              child: Text("تشغيل الصوت"),
            ),
          ),
        ],
      ),
    );
  }
}
