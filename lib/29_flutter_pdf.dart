import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_flutter/pdf_flutter.dart';
import 'package:file_picker/file_picker.dart';

// Package: advance_pdf_viewer
import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

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
          PDF.asset(
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

// 

class AdvancePDFViewer extends StatefulWidget {
  @override
  _AdvancePDFViewer createState() => _AdvancePDFViewer ();
}

class _AdvancePDFViewer extends State<AdvancePDFViewer > {
  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset('assets/sample.pdf');
    //document = await PDFDocument.fromFile('assets/sample.pdf');

    setState(() => _isLoading = false);
  }

  changePDF(value) async {
    setState(() => _isLoading = true);
    if (value == 1) {
      document = await PDFDocument.fromAsset('assets/demopdf.pdf');
    } else if (value == 2) {
      document = await PDFDocument.fromURL(
        "http://conorlastowka.com/book/CitationNeededBook-Sample.pdf",
        /* cacheManager: CacheManager(
          Config(
            "customCacheKey",
            stalePeriod: const Duration(days: 2),
            maxNrOfCacheObjects: 10,
          ),
        ), */
      );
    } else {
      document = await PDFDocument.fromAsset('assets/sample.pdf');
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              SizedBox(height: 36),
              ListTile(
                title: Text('Load from Assets'),
                onTap: () {
                  changePDF(1);
                },
              ),
              ListTile(
                title: Text('Load from URL'),
                onTap: () {
                  changePDF(2);
                },
              ),
              ListTile(
                title: Text('Restore default'),
                onTap: () {
                  changePDF(3);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('FlutterPluginPDFViewer'),
        ),
        body: Center(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : PDFViewer(
                  document: document,
                  zoomSteps: 1,
                  //uncomment below line to preload all pages
                  // lazyLoad: false,
                  // uncomment below line to scroll vertically
                  // scrollDirection: Axis.vertical,

                  //uncomment below code to replace bottom navigation with your own
                  /* navigationBuilder:
                      (context, page, totalPages, jumpToPage, animateToPage) {
                    return ButtonBar(
                      alignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.first_page),
                          onPressed: () {
                            jumpToPage()(page: 0);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            animateToPage(page: page - 2);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            animateToPage(page: page);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.last_page),
                          onPressed: () {
                            jumpToPage(page: totalPages - 1);
                          },
                        ),
                      ],
                    );
                  }, */
                ),
        ),
    );
  }
}
