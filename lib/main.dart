import 'package:flutter/material.dart';

// Import the application imports.
import '02_simple_text_screen.dart';
import '03_blue_screen.dart';

// main function
// Start the app with the "/" named route. In this case, the app starts
// on the FirstScreen widget.
// When navigating to the "/" route, build the FirstScreen widget.
// When navigating to the "/second" route, build the SecondScreen widget.
void main() {
  print("Inside the main");
  runApp(MyAppMain());
}

class MyAppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Named Routes Demo');
    return (MaterialApp(
      title: 'Named Routes Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => MainMenuScreen(),
        '/simple_text': (context) => SimpleTextScreen(),
        '/03Blue': (context) => BlueScreen(),
      },
    ));
  }
}

class MainMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutorial Main Menu Screen'),
      ),
      body: Column(
        children: <Widget>[
          btn02SimpleText(context),
          btn03BlueScreen(context),
       ],
      ),
    );
  }


  Widget btn02SimpleText(BuildContext context)
  {
    return RaisedButton(
      child: Text('Simple Text screen'),
      onPressed: () {
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, '/simple_text');
      },
    );
  }

  Widget btn03BlueScreen(BuildContext context)
  {
    return RaisedButton(
      child: Text('Blue Screen'),
      onPressed: () {
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, '/03Blue');
      },
    );
  }
}

// Notes:
// void main() => runApp(MyApp());
// OR other way to represent
// void main() {
//   runApp(
//     MyApp(),
//   );
// }
