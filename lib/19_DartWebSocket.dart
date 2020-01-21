import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';



class DartWebSocket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return  _MyHomePageState();
  }
}

IOWebSocketChannel channel;

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    channel = IOWebSocketChannel.connect("ws://10.5.11.88:7777");
    //channel = IOWebSocketChannel.connect("wss://echo.websocket.org/");


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
                print("StreamBuilding: receiving: ${snapshot.data}");
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
    String str1 = "shared_init:stream_en&false&max_color&255&";

    if (editingController.text.isNotEmpty){
      //widget.channel.sink.add(editingController.text);
      //print("Sending: ${editingController.text}");
      //channel.sink.add(editingController.text);
      print("Sending: $str1");
      channel.sink.add(str1);
    }

    @override
    void dispose(){
      //widget.channel.sink.close();
      channel.sink.close();
      super.dispose();
    }
  }
}
