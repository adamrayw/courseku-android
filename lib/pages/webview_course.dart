import 'package:courseku_mobile/theme.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewCourse extends StatelessWidget {
  final String link;
  const WebviewCourse({Key? key, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            color: primaryTextColor,
          ),
        ),
        title: Text(
          link,
          style: primaryTextStyle,
        ),
        elevation: 0.4,
      ),
      body: Builder(
        builder: (BuildContext context) {
          return WebView(
            initialUrl: link,
            javascriptMode: JavascriptMode.unrestricted,
          );
        },
      ),
    );
  }
}
