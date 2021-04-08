import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:web_view/web_view_example.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String qrCode = "Al Huda";

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
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/images/al_huda.jpg'),
            width: double.infinity,
            fit: BoxFit.cover,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        child: Icon(
          Icons.qr_code_scanner,
          color: Colors.white,
          size: 30,
        ),
        onPressed: scanQRCode,
      ),
    );
  }

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });

      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => WebViewExample(
                link: qrCode,
              )));
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
}
