import 'package:flutter/material.dart';


class CustomFonts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/1.jpg'),
              ),
              Center(
                child: Text(
                  'Shraddha',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: Colors.teal.shade200,
                    fontSize: 20.0,
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      '+49 576123456',
                      style: TextStyle(
                        color: Colors.teal.shade700,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),

              Container(

                color: Colors.white,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                child: Row(
                  children: <Widget>[
                  Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  'shraddha@gmail.com',
                  style: TextStyle(
                    color: Colors.teal.shade700,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,

                  ),
                ),
                  ],
                ),
              ),
              Container(child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Go back!',
                    style: TextStyle(
                      color: Colors.teal.shade900,
                    ),


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
