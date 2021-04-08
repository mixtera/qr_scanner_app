import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class WebViewExample extends StatefulWidget {
  //link must

  final String link;
  WebViewExample({this.link});

  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  String _link = "https://";

  void _validate() {
    if (widget.link.startsWith("https://") ||
        widget.link.startsWith("http://")) {
      _link = widget.link;
    } else {
      _link = _link + widget.link;
    }

    print(_link);
  }

  @override
  void initState() {
    super.initState();
    _validate();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        centerTitle: true,
        elevation: 3,
        title: Text(
          "Al Huda Qur'an app",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        //padding: EdgeInsets.all(10),
        child: WebView(
          key: UniqueKey(),
          javascriptMode: JavascriptMode.unrestricted,
          //link must
          initialUrl: _link,
        ),
      ),
    );
  }
}
