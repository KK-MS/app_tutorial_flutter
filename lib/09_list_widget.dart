import 'package:flutter/material.dart';

class ListWidgetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade200,
      appBar: AppBar(
        title: Text(
          'Email Address',
          style: TextStyle(
            color: Colors.brown.shade200,
          ),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(40.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.brown.shade200,
                ),
                title: Text(
                  'shraddha@gmail.com',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
