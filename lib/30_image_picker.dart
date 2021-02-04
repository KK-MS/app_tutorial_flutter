import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FlutterImagePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imagepicker Demo',
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
        title: Text("Imagepicker Demo"),
        backgroundColor: Colors.indigoAccent,
      ),
      body: LoadImage(image: _image),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          opencamera();
          print('camera opened');
          var timestamp = DateTime.now();
          print(timestamp);
        },
        label: Text('Camera'),
        icon: Icon(Icons.camera),
        backgroundColor: Colors.indigoAccent,
      ),
    );
  }
}

class LoadImage extends StatelessWidget {
  const LoadImage({
    Key key,
    @required File image,
  })  : _image = image,
        super(key: key);

  final File _image;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      height: 700,
      width: 700,
      child: GestureDetector(
        onTap: () {
          print('Gesture Detector initialized');
        },
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) =>
              _image == null ? Text("Still waiting!") : Image.file(_image),
        ),
      ),
    );
  }
}
