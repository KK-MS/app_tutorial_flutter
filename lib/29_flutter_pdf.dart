import 'package:flutter/material.dart';
import 'package:pdf_flutter/pdf_flutter.dart';

class FlutterPdf extends StatefulWidget {
  @override
  _FlutterPdfState createState() => _FlutterPdfState();
}

class _FlutterPdfState extends State<FlutterPdf> {
  String url =
      'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf';
  //String url = 'http://africau.edu/images/default/sample.pdf';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                PDF.network(
                  url,
                  height: 500,
                  width: 500,
                );
              },
            ),
            RaisedButton(
              child: Text('PDF from Assest'),
              onPressed: () {
                print('PDF Loaded');
              },
            ),
          ],
        ),
      ),
    );
  }
}
