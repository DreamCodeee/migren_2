import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Ucuncuegzersizz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Egzersizler"),
      ),
      body: WebView(
        initialUrl: "https://www.youtube.com/watch?v=vznNsiohhwQ",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
