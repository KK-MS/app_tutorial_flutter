import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(backgroundColor: Colors.grey,
      title: Text('Welcome to Second Screen'),
       ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Please prssed this button',),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
      child: Icon(Icons.add,
      ),
        onPressed: (){

        }
      ),
      );
  }
}