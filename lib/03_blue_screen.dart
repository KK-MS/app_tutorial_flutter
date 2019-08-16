import 'package:flutter/material.dart';

// Navigate back to the first screen by popping the current route
// off the stack.
class BlueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple blue Screen"),
      ),
      body: Center(
        child: Container(
          //padding: const EdgeInsets.all(18.0),
          color: Colors.blue,
          //child: RaisedButton(
          //  color: Colors.green,
          //  onPressed: () {
          //    Navigator.pop(context);
          //  },
          //  child: Text('Go back!'),
          //),
        ),
      ),
    );
  }
}
