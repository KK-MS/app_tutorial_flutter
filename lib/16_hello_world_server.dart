import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';

class Server extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
      ),
    );
  }
}

Future main() async {
  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    4040,
  );
  print('Listening on http://${server.address.address}:${server.port}/');

  await for (HttpRequest request in server) {
    request.response.write('Hello, world!');
    await request.response.close();
  }
}