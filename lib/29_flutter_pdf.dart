import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_flutter/pdf_flutter.dart';
import 'package:file_picker/file_picker.dart';

// Gloal variables declared
final String url =
    "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf";

File localfile;
var progressString = "";

class FlutterPdf extends StatefulWidget {
  @override
  _FlutterPdfState createState() => _FlutterPdfState();
}

class _FlutterPdfState extends State<FlutterPdf> {
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
            Container(
              child: Center(
                child: Text(
                  'PDF is obtained from $url',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            RaisedButton(
              color: Colors.amber,
              child: Text('PDF from URL'),
              onPressed: () {
                print('URL to be loaded');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PdfUrl(),
                  ),
                );
              },
            ),
            RaisedButton(
              color: Colors.blueAccent,
              child: Text('PDF from Assest'),
              onPressed: () {
                print('Asset PDF Loaded');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PdfAsset(),
                  ),
                );
              },
            ),
            RaisedButton(
              onPressed: () async {
                FilePickerResult pickedFile =
                    await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf'],
                );
                if (pickedFile != null) {
                  localfile = File(pickedFile.files.single.path);
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PdfDevice(),
                  ),
                );
              },
              child: Text('PDF from file/Device Storage'),
              color: Colors.greenAccent,
            ),
          ],
        ),
      ),
    );
  }
}

// Flutter PDF class to access PDF from URL and download them

class PdfUrl extends StatefulWidget {
  @override
  _PdfUrlState createState() => _PdfUrlState();
}

class _PdfUrlState extends State<PdfUrl> {
  bool downloading = false;
  Future<void> downloadPdf() async {
    Dio dio = Dio();

    try {
      var dir = await getExternalStorageDirectory();
      String path = dir.path;
      String fileName = "$path/terms&conditons.pdf";
      await dio.download(
        url,
        fileName,
        onReceiveProgress: (count, total) {
          print("Received = $count, Total = $total");

          setState(() {
            downloading = true;
            progressString = ((count / total) * 100).toStringAsFixed(0) + "%";
          });
        },
      );
    } catch (e) {
      print(e);
    }
    setState(() {
      downloading = false;
      progressString = "Completed";
    });
    print("Download Completed");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          PDF.network(
            url,
            height: MediaQuery.of(context).size.height * 0.80,
            width: MediaQuery.of(context).size.width * 0.80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                onPressed: () {
                  downloadPdf();
                  print('Button Working');
                },
                child: Text('Download File:  $progressString"'),
                color: Colors.blue,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FlutterPdf(),
                    ),
                  );
                },
                child: Text('Return'),
                color: Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Class to access PDF from assets
class PdfAsset extends StatefulWidget {
  @override
  _PdfAssetState createState() => _PdfAssetState();
}

class _PdfAssetState extends State<PdfAsset> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          PDF.assets(
            'assets/demopdf.pdf',
            height: MediaQuery.of(context).size.height * 0.90,
            width: MediaQuery.of(context).size.width * 0.90,
          ),
          FlatButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => FlutterPdf(),
                ),
              );
            },
            child: Text('Return'),
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

// class to load PDF from device storage

class PdfDevice extends StatefulWidget {
  @override
  _PdfDeviceState createState() => _PdfDeviceState();
}

class _PdfDeviceState extends State<PdfDevice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          PDF.file(
            localfile,
            height: MediaQuery.of(context).size.height * 0.90,
            width: MediaQuery.of(context).size.width * 0.90,
          ),
          FlatButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => FlutterPdf(),
                ),
              );
            },
            child: Text('Return'),
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
