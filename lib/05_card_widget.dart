import 'package:flutter/material.dart';

// Navigate back to the first screen by popping the current route
// off the stack.
class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple blue Screen"),
      ),
      body: Center(
        child: Container(
          child: Container(
            width: 200,
            height: 100,
            child: Text("Hello"),
          ),
        ),
      ),
    );
  }
}
