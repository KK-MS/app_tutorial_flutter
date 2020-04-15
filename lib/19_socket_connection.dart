import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class SocketScreen extends StatefulWidget {
  @override
  _SocketScreenState createState() => _SocketScreenState();
}

class _SocketScreenState extends State<SocketScreen> {
  var socket = Socket.connect('192.168.178.54', 8888);
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

Widget build(BuildContext context) {
  final title = 'TCP Socket Demo';
  var socket;
  return MaterialApp(
    title: title,
    home: MyHomePage(
      title: title,
      channel: socket,
    ),
  );
}

class MyHomePage extends StatefulWidget {
  final String title;
  final Socket channel;

  MyHomePage({Key key, @required this.title='TCP Socket Demo', @required this.channel})
      : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Send a message'),
              ),
            ),
            StreamBuilder(
              stream: widget.channel,
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Row(
                    children: <Widget>[
                      Text(snapshot.hasData
                          ? '${String.fromCharCodes(snapshot.data)}'
                          : ''),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      widget.channel.write(_controller.text);
    }
  }

  @override
  void dispose() {
    widget.channel.close();
    super.dispose();
  }
}
