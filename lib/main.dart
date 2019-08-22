import 'package:flutter/material.dart';

// Import the application imports.
import '02_simple_text_screen.dart';
import '03_blue_screen.dart';
import '04_icon_screen.dart';
import '05_card_widget.dart';
import '06_floating_btn.dart';
import '07_custome_fonts.dart';
import '08_layouts_row_column.dart';
import '09_list_widget.dart';
import '10_expanded_screen.dart';


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
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.red,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      title: 'Named Routes Demo',
      initialRoute: '/', // First screen of list of Main menu
      routes: {
        '/': (context) => MainMenuScreen(),
        '/simple_text': (context) => SimpleTextScreen(),
        '/03Blue': (context) => BlueScreen(),
        '/04Icon': (context) => IconScreen(),
        '/05Card': (context) => CardWidget(),
        '/06Floating': (context) => FloatingBtnDemo(),
        '/07customefonts':(context) => CustomFonts(),
        '/08layouts':(context) => LayoutsRowColumn(),
        '/09listwidget':(context)=> ListWidgetScreen(),
        '/10Expanded' : (context) => ExpandedWidgetScreen(),

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
          btn04IconScreen(context),
          btn05CardWidget(context),
          btn05Floating(context),
          btn07CustomFonts(context),
          btn08Layouts(context),
          btn09ListWidget(context),
          btn10Expanded(context),

       ],
      ),
    );
  }


  Widget btn02SimpleText(BuildContext context)
  {
    print("I am inside btn Simple text");

    return RaisedButton(
      child: Text('Simple Text screen'),
      onPressed: () {
        print("On pressed btn Simple text");
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
        print("On pressed btn blue ");
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, '/03Blue');
      },
    );
  }

  Widget btn04IconScreen(BuildContext context)
  {
    return RaisedButton(
      child: Text('Icon Screen'),
      onPressed: () {
        print("On pressed btn Icon ");
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, '/04Icon');
      },
    );
  }

  Widget btn05CardWidget(BuildContext context)
  {
    return RaisedButton(
      child: Text('Card demo'),
      onPressed: () {
        print("On pressed btn card ");
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, '/05Card');
      },
    );
  }

   Widget btn05Floating(BuildContext context)
  {
    return RaisedButton(
      child: Text('Floating button demo'),
      onPressed: () {
        print("On pressed btn floating btn ");
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, '/06Floating');
      },
    );
  }

  Widget btn07CustomFonts(BuildContext context)
  {
    return RaisedButton(
      child: Text('Customfonts'),
      onPressed: () {
        print("On pressed btn customfonts btn ");
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, '/07customefonts');
      },
    );
  }


  Widget btn08Layouts(BuildContext context)
  {
    //print("I am inside btn Simple text");

    return RaisedButton(
      child: Text('Layouts'),
      onPressed: () {
        print("On pressed btn layouts btm");
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, '/08layouts');
      },
    );
  }

  Widget btn09ListWidget(BuildContext context)
  {
    return RaisedButton(
      child: Text('List widget'),
      onPressed: () {
        print("On pressed btn listwidget btn ");
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, '/09listwidget');
      },
    );
  }

  Widget btn10Expanded(BuildContext context)
  {
    return RaisedButton(
      child: Text('Expanded widget'),
      onPressed: () {
        print("On pressed btn Expanded btn ");
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, '/10Expanded');
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
