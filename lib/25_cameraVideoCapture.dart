import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';

class VideoRecorderExample extends StatefulWidget {
  @override
  _VideoRecorderExampleState createState() {
    return _VideoRecorderExampleState();
  }
}

class _VideoRecorderExampleState extends State<VideoRecorderExample> {
  CameraController controller;
  // Data path to store the files. Both the video and text files//
  String videoPath;
  double startLat;
  double startLong;
  double stopLat;
  double stopLong;
  DateTime startTime;
  DateTime stopTime;

  List<CameraDescription> cameras;
  int selectedCameraIdx;

  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    // Get the listonNewCameraSelected of available cameras.
    // Then set the first camera as selected.
    availableCameras().then((availableCameras) {
      cameras = availableCameras;

      if (cameras.length > 0) {
        setState(() {
          selectedCameraIdx = 0;
        });

        _onCameraSwitched(cameras[selectedCameraIdx]).then((void v) {});
      }
    }).catchError((err) {
      print('Error: $err.code\nError Message: $err.message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Video Recorder'),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        height: double.infinity,
        width: double.infinity,
        color: Colors.tealAccent,
        child: Column(
          children: <Widget>[
            Card(
              elevation: 10,
              color: Colors.amber,
              child: Row(
                verticalDirection: VerticalDirection.up,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //verticalDirection: VerticalDirection.up,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 300,
                    width: 300,
                    child: _cameraPreviewWidget(),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(
                        color: controller != null &&
                                controller.value.isRecordingVideo
                            ? Colors.redAccent
                            : Colors.yellow[300],
                        width: 5.0,
                      ),
                    ),
                  ),
                  _cameraTogglesRowWidget(),
                  _captureControlRowWidget(),
                ],
              ),
            ),
            Card(
              elevation: 10,
              color: Colors.blueGrey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text('$videoPath'),
                    Text('$startLat'),
                    Text('$startLong'),
                    Text('$startTime'),
                    Text('$stopLat'),
                    Text('$stopLong'),
                    Text('$stopTime'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// Widget to get Camera lens direction. Used to trigger back or front camera
  IconData _getCameraLensIcon(CameraLensDirection direction) {
    switch (direction) {
      case CameraLensDirection.back:
        return Icons.camera_rear;
      case CameraLensDirection.front:
        return Icons.camera_front;
      case CameraLensDirection.external:
        return Icons.camera;
      default:
        return Icons.device_unknown;
    }
  }

  // Display 'Loading' text when the camera is still loading.
  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
  }

  /// Display a row of toggle to select the camera (or a message if no camera is available).
  Widget _cameraTogglesRowWidget() {
    if (cameras == null) {
      return Row();
    }

    CameraDescription selectedCamera = cameras[selectedCameraIdx];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;

    return Container(
        // width: 20.0,
        // height: 20.0,
        // child: Row(
        //     crossAxisAlignment: CrossAxisAlignment.end,
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     mainAxisSize: MainAxisSize.max,
        child: IconButton(
      iconSize: 50.0,
      icon: Icon(_getCameraLensIcon(lensDirection)),
      color: Colors.black,
      onPressed: _onSwitchCamera,
    )
        // child: RaisedButton.icon(
        //   onPressed: _onSwitchCamera,
        //   icon: Icon(_getCameraLensIcon(lensDirection)),
        //   label: Text(
        //     "${lensDirection.toString().substring(lensDirection.toString().indexOf('.') + 1)}",
        //   ),
        //   color: Colors.indigoAccent,
        // ),
        );
  }

  /// Display the control bar with buttons to record videos and stop videos.
  Widget _captureControlRowWidget() {
    return Container(
      // width: 20.0,
      // height: 20.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          IconButton(
            iconSize: 50.0,
            icon: const Icon(Icons.videocam),
            color: Colors.blue,
            onPressed: controller != null &&
                    controller.value.isInitialized &&
                    !controller.value.isRecordingVideo
                ? _onRecordButtonPressed
                : null,
          ),
          // child: RaisedButton.icon(
          //   onPressed: controller != null &&
          //           controller.value.isInitialized &&
          //           !controller.value.isRecordingVideo
          //       ? _onRecordButtonPressed
          //       : null,
          //   icon: const Icon(Icons.videocam),
          //   color: Colors.blueAccent,
          //   label: Text("Record"),
          // ),
          IconButton(
            iconSize: 50.0,
            icon: const Icon(Icons.stop),
            color: Colors.red,
            onPressed: controller != null &&
                    controller.value.isInitialized &&
                    controller.value.isRecordingVideo
                ? _onStopButtonPressed
                : null,
          ),

          // child: RaisedButton.icon(
          //   icon: const Icon(Icons.stop),
          //   color: Colors.redAccent,
          //   onPressed: controller != null &&
          //           controller.value.isInitialized &&
          //           controller.value.isRecordingVideo
          //       ? _onStopButtonPressed
          //       : null,
          //   label: Text("Stop"),
          // ),
        ],
      ),
    );
  }

  Future<void> _onCameraSwitched(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }

    controller = CameraController(
        cameraDescription,
        ResolutionPreset
            .high); // Resolution Preset can be set as per the specification required.
    // Press F12 at resolution preset for more info//

    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }

      if (controller.value.hasError) {
        Fluttertoast.showToast(
            msg: 'Camera error ${controller.value.errorDescription}',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  void _onSwitchCamera() {
    selectedCameraIdx =
        selectedCameraIdx < cameras.length - 1 ? selectedCameraIdx + 1 : 0;
    CameraDescription selectedCamera = cameras[selectedCameraIdx];

    CameraLensDirection view = selectedCamera.lensDirection;

    _onCameraSwitched(selectedCamera);
    Fluttertoast.showToast(
        msg: '$view triggered',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.black,
        textColor: Colors.white);

    setState(() {
      selectedCameraIdx = selectedCameraIdx;
    });
  }

// Starts Recording when button is pressed. Also added GPS and Timestamp which collects the information at the start of the video
  void _onRecordButtonPressed() {
    _startVideoRecording().then((String filePath) async {
      if (filePath != null) {
        Fluttertoast.showToast(
            msg: 'Recording video started.GPS and Timestamp recorded',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.grey,
            textColor: Colors.white);
      }
      final startgpsdata = await Location().getLocation();
      print(startgpsdata.latitude);
      print(startgpsdata.longitude);
      var starttimestamp = DateTime.now();
      print(starttimestamp);

      final startcontents = [
        startgpsdata.latitude,
        startgpsdata.longitude,
        starttimestamp,
      ].toString();

      startLat = startgpsdata.latitude;
      startLong = startgpsdata.longitude;
      startTime = starttimestamp;

      final startdirectory = await getExternalStorageDirectory();
      // For your reference print the AppDoc directory
      //print(startdirectory.path);
      final String startTextDirectory = '${startdirectory.path}/StartTextFiles';
      await Directory(startTextDirectory).create(recursive: true);
      final File startTextfilePath =
          new File('$startTextDirectory/$starttimestamp.txt');
      await startTextfilePath.writeAsString('$startcontents');
      print('file saved. Check');
      print(startTextDirectory);
      print(startTextfilePath);

      return File(startTextDirectory);
    });
  }

// Stops Recording when button is pressed. Also added GPS and Timestamp which collects the information at the end of the video
  void _onStopButtonPressed() {
    _stopVideoRecording().then((_) async {
      if (mounted) setState(() {});
      Fluttertoast.showToast(
          msg: 'Video recorded to $videoPath.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.grey,
          textColor: Colors.white);
      final stopgpsdata = await Location().getLocation();
      print(stopgpsdata.latitude);
      print(stopgpsdata.longitude);

      var stoptimestamp = DateTime.now();
      print(stoptimestamp);

      final stopcontents = [
        stopgpsdata.latitude,
        stopgpsdata.longitude,
        stoptimestamp,
      ];

      stopLat = stopgpsdata.latitude;
      stopLong = stopgpsdata.longitude;
      stopTime = stoptimestamp;
      final stopdirectory = await getExternalStorageDirectory();
      final String stopTextDirectory = '${stopdirectory.path}/StopTextFiles';
      await Directory(stopTextDirectory).create(recursive: true);
      final File stopTextfilePath =
          new File('$stopTextDirectory/$stoptimestamp.txt');
      await stopTextfilePath.writeAsString('$stopcontents');
      print('file saved. Check');
      print(stopTextDirectory);
      print(stopTextfilePath);

      return File(stopTextDirectory);
    });
  }

// Function called during the video recording
  Future<String> _startVideoRecording() async {
    if (!controller.value.isInitialized) {
      Fluttertoast.showToast(
          msg: 'Please wait',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.grey,
          textColor: Colors.white);

      return null;
    }

    // Do nothing if a recording is on progress
    if (controller.value.isRecordingVideo) {
      return null;
    }
// To look out for the directory to store the video and the text file.
    final Directory appDirectory = await getExternalStorageDirectory();
    final String videoDirectory = '${appDirectory.path}/Videos';
    await Directory(videoDirectory).create(recursive: true);
    final String currentTime = DateTime.now().toString();
    final String filePath = '$videoDirectory/$currentTime.mp4';

    try {
      await controller.startVideoRecording(filePath);
      videoPath = filePath;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }

    return filePath;
  }

// Function called during the video recording
  Future<void> _stopVideoRecording() async {
    if (!controller.value.isRecordingVideo) {
      return null;
    }
    try {
      await controller.stopVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

// Throws camera exception error if camera is not opened.
  void _showCameraException(CameraException e) {
    String errorText = 'Error: ${e.code}\nError Message: ${e.description}';
    print(errorText);

    Fluttertoast.showToast(
        msg: 'Error: ${e.code}\n${e.description}',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }
}

class VideoRecorderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VideoRecorderExample(),
    );
  }
}

Future<void> main() async {
  runApp(VideoRecorderApp());
}
