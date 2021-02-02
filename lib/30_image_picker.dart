import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FlutterImagePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sample Imagepicker Widget',
      home: ImagePickerWidget(),
    );
  }
}

class ImagePickerWidget extends StatefulWidget {
  ImagePickerWidget({Key key}) : super(key: key);

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State {
  File _image;
  List items = [];
  @override
  void initState() {
    super.initState();
  }

  void opencamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample Imagepicker Widget"),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Column(
        children: [
          GestureDetector(
            child: Container(
              color: Colors.black12,
              height: 300,
              width: 300.0,
              child:
                  _image == null ? Text("Still waiting!") : Image.file(_image),
            ),
            onTap: () async {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          opencamera();
          print('camera opened');
        },
        label: Text('Camera'),
        icon: Icon(Icons.camera),
        backgroundColor: Colors.indigoAccent,
      ),
    );
  }
}
