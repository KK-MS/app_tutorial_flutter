import 'package:flutter/material.dart';

// Comment on ICON....
// Navigate back to the first screen by popping the current route
// off the stack.
class IconScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Icon Screen"),
      ),
      body: Center(
        child: RaisedButton.icon(
          icon: Icon(Icons.accessibility),
          label: Text('Go back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
