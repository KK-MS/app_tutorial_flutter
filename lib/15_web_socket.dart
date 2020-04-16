import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';



class WebSocket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: MyHomePage(
//        channel: IOWebSocketChannel.connect("ws://echo.Websocket.org"),
        //  test server provided by websocket.org
        //The server sends back the same message you send to it.
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
//  final WebSocketChannel channel;
//  MyHomePage({@required this.channel});

  @override
  _MyHomePageState createState() {
    return  _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController editingController = TextEditingController();
  IOWebSocketChannel channel;
  @override
  Widget build(BuildContext context) {
    //channel = IOWebSocketChannel.connect("ws://echo.Websocket.org");
    channel = IOWebSocketChannel.connect("ws://10.5.11.88:7777");


    return  Scaffold(
      appBar: AppBar(
        title:  Text("Web Socket"),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child:  TextFormField(
                decoration:  InputDecoration(labelText: "Send any Message"),
                controller: editingController,
              ),
            ),
            StreamBuilder(
              //stream: widget.channel.stream,
              stream: channel.stream,
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(snapshot.hasData ? 'SERVER SENT->${snapshot.data}' : ''),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton:  FloatingActionButton(
          child: Icon(Icons.send),

          onPressed: _sendMyMessage
      ),



    );
  }

  void _sendMyMessage(){
    if (editingController.text.isNotEmpty){
      //widget.channel.sink.add(editingController.text);
      channel.sink.add(editingController.text);
    }

    @override
    void dispose(){
      //widget.channel.sink.close();
      channel.sink.close();
      super.dispose();
    }
  }
}




