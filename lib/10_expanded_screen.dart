import 'package:flutter/material.dart';

class ExpandedWidgetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        title: Text('Photo Album'),
        backgroundColor: Colors.yellow,
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: Image(
              image: AssetImage('images/dice1.jpg'),
            ),
          ),
          Expanded(
            child: Image(
              image: AssetImage('images/dice1.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}
