import 'package:flutter/material.dart';

class FloatingBtnDemo extends StatelessWidget {

  int value = 10;
  final String strDisp = "This string is from variable. Note: no \$ used in the code";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Welcome to Second Screen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
           'The Text is: $strDisp. value=$value',
//            'Current value is $value',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            value += 9;
            print("Floating btn pressed. Value = $value");
          }

          ),
    );
  }
}
