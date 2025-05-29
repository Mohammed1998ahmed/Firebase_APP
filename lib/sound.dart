import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class MyApp extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  Future<void> speak(String text) async {
    await flutterTts.setLanguage("ar-SA"); // اللغة العربية
    await flutterTts.setPitch(1.0); // طبقة الصوت
    await flutterTts.setSpeechRate(0.5); // سرعة القراءة
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter TTS 4.2.2")),
        body: Center(
          child: ElevatedButton(
            onPressed: () => speak("مرحبا، هذا صوت آلي يعمل في تطبيق Flutter!"),
            child: Text("تشغيل الصوت"),
          ),
        ),
      ),
    );
  }
}
