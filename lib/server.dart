
import 'dart:io';
import 'dart:async';

Future main() async {
  var server = await HttpServer.bind(
    InternetAddress.anyIPv4,
    4041,
  );
  print('Listening on http://${server.address.address}:${server.port}/');

  await for (HttpRequest request in server) {
    request.response.write('dont just studz understand ccc c!');
    await request.response.close();



  }
}