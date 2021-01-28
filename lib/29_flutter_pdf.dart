import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf_flutter/pdf_flutter.dart';

class FlutterPdf extends StatefulWidget {
  @override
  _FlutterPdfState createState() => _FlutterPdfState();
}

class _FlutterPdfState extends State<FlutterPdf> {
  File localfile;
  String url =
      'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter PDF Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Colors.amber,
              child: Text('PDF from URL'),
              onPressed: () {
                print('URL to be loaded');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PDF.network(
                      url,
                      height: MediaQuery.of(context).size.height * 0.50,
                      width: MediaQuery.of(context).size.width * 0.20,
                    ),
                  ),
                );
              },
            ),
            Container(
              child: Text(
                'PDF is obtained from $url',
                style: TextStyle(fontSize: 20),
              ),
            ),
            RaisedButton(
              color: Colors.blueAccent,
              child: Text('PDF from Assest'),
              onPressed: () {
                print('Asset PDF Loaded');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PDF.assets(
                      'assets/demopdf.pdf',
                      height: MediaQuery.of(context).size.height * 0.50,
                      width: MediaQuery.of(context).size.width * 0.30,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}