import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

// For HTML Websocket.
//import 'package:web_socket_channel/html.dart';

main() async {
  var channel = IOWebSocketChannel.connect("wss://10.5.11.88:7777");

  channel.stream.listen((message) {
    channel.sink.add("received!");
    channel.sink.close(status.goingAway);
  });
}


//main1() async {
//  var channel = HtmlWebSocketChannel.connect("ws://localhost:8181");
//  channel.sink.add("connected!");
//  channel.stream.listen((message) {
//    // ...
//  });
//}