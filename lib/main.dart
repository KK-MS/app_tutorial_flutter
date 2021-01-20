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
import '11_dicee_page.dart';
import '12_xylo_phone.dart';
import '13_quizzler_app.dart';
import '14_markdown_screen.dart';
import '15_web_socket.dart';
import '16_hello_world_server.dart';
import '17_hello_client_server.dart';
//import '18_multilanguage.dart';
import '19_DartWebSocket.dart';
import '20_socket_connection.dart';
import '21_barchart.dart';
import '22_linechart.dart';
import '23_piechart.dart';
import '24_barchart_3d.dart';
import '26_scatterplot_3d.dart';
import '27_flutter_echarts_simple_bar.dart';
import '28_filesave.dart';

// main function
// Start the app with the "/" named route. In this case, the app starts
// on the FirstScreen widget.
// When navigating to the "/" route, build the FirstScreen widget.
// When navigating to the "/second" route, build the SecondScreen widget.
void main() {
  print("Inside the main");
  runApp(new MyAppMain());
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
        '/': (context) => Center(child: MainMenuScreen()),
        '/02simple_text': (context) => SimpleTextScreen(),
        '/03Blue': (context) => BlueScreen(),
        '/04Icon': (context) => IconScreen(),
        '/05Card': (context) => CardWidget(),
        '/06Floating': (context) => FloatingBtnDemo(),
        '/07customefonts': (context) => CustomFonts(),
        '/08layouts': (context) => LayoutsRowColumn(),
        '/09listwidget': (context) => ListWidgetScreen(),
        '/10Expanded': (context) => ExpandedWidgetScreen(),
        '/11Dicepage': (context) => DicePage(),
        '/12xylophone': (context) => XylophoneApp(),
        '/13quizzeler': (context) => Quizzler(),
        '/14markdown': (context) => FirstParameter(),
        '/15websocket': (context) => WebSocket(),
        '/16server': (context) => Server(),
        '/17serverclient': (context) => ServerClient(),
        //'/18multilanguage': (context) => Multilang(),
        '/19dartwebsocket': (context) => DartWebSocket(),
        '/20socketconnection': (context) => SocketScreen(),
        '/21bargraph': (context) => BarGraph(),
        '/22linegraph': (context) => LineGraph(),
        '/23piegraph': (context) => PieGraph(),
        '/24bar3dgraph': (context) => BarGraph3D(),
        '/26scatterplot': (context) => ScatterPlot3D(),
        '/27flutterechartssimplebar': (context) => EchartSimpleBar(),
        '/28filesave': (context) => FileSave(),
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
      body: ListView(
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
          btn11diceepage(context),
          btn12xylophone(context),
          btn13quizzler(context),
          btn14markdown(context),
          btn15Websocket(context),
          btn16helloworldserver(context),
          btn17clientdserver(context),
          //btn18multilanguage(context),
          btn19dartwebsocket(context),
          btn20socketconnection(context),
          btn21bargraph(context),
          btn22linegraph(context),
          btn23piegraph(context),
          btn24bar3dgraph(context),
          btn26scatterplot(context),
          btn27flutterechartssimplebar(context),
          btn28filesave(context),
        ],
      ),
    );
  }

  Widget btn02SimpleText(BuildContext context) {
    print("I am inside btn Simple text");

    return RaisedButton(
      child: Text('Simple Text screen'),
      onPressed: () {
        print("On pressed btn Simple text");
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, '/02simple_text');
      },
    );
  }

  Widget btn03BlueScreen(BuildContext context) {
    return RaisedButton(
      child: Text('Blue Screen'),
      onPressed: () {
        print("On pressed btn blue ");
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, '/03Blue');
      },
    );
  }

  Widget btn04IconScreen(BuildContext context) {
    return RaisedButton(
      child: Text('Icon Screen'),
      onPressed: () {
        print("On pressed btn Icon ");
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, '/04Icon');
      },
    );
  }

  Widget btn05CardWidget(BuildContext context) {
    return RaisedButton(
      child: Text('Card demo'),
      onPressed: () {
        print("On pressed btn card ");
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, '/05Card');
      },
    );
  }

  Widget btn05Floating(BuildContext context) {
    return RaisedButton(
      child: Text('Floating button demo'),
      onPressed: () {
        print("On pressed btn floating btn ");
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, '/06Floating');
      },
    );
  }

  Widget btn07CustomFonts(BuildContext context) {
    return RaisedButton(
      child: Text('Customfonts'),
      onPressed: () {
        print("On pressed btn customfonts btn ");
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, '/07customefonts');
      },
    );
  }

  Widget btn08Layouts(BuildContext context) {
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

  Widget btn09ListWidget(BuildContext context) {
    return RaisedButton(
      child: Text('List widget'),
      onPressed: () {
        print("On pressed btn listwidget btn ");
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, '/09listwidget');
      },
    );
  }

  Widget btn10Expanded(BuildContext context) {
    return RaisedButton(
      child: Text('Expanded widget'),
      onPressed: () {
        print("On pressed btn Expanded btn ");
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, '/10Expanded');
      },
    );
  }

  Widget btn11diceepage(BuildContext context) {
    return RaisedButton(
      child: Text('Dice Page with two images'),
      onPressed: () {
        print("On pressed btn Expanded btn ");
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, '/11Dicepage');
      },
    );
  }

  Widget btn12xylophone(BuildContext context) {
    return RaisedButton(
      child: Text('Musical App'),
      onPressed: () {
        print("On pressed btn Musical App btn ");
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, '/12xylophone');
      },
    );
  }

  Widget btn13quizzler(BuildContext context) {
    return RaisedButton(
      child: Text('Quiz'),
      onPressed: () {
        print("On pressed btn quiz btn ");
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, '/13quizzeler');
      },
    );
  }
}

Widget btn14markdown(BuildContext context) {
  return RaisedButton(
    child: Text('Evaluation Sheet'),
    onPressed: () {
      print("On pressed btn EvaluationSheet btn ");
      // Navigate to the second screen using a named route.
      Navigator.pushNamed(context, '/14markdown');
    },
  );
}

Widget btn15Websocket(BuildContext context) {
  return RaisedButton(
    child: Text('Web Socket'),
    onPressed: () {
      print("On pressed btn websocket btn ");
      // Navigate to the second screen using a named route.
      Navigator.pushNamed(context, '/15websocket');
    },
  );
}

Widget btn16helloworldserver(BuildContext context) {
  return RaisedButton(
    child: Text('Hello world Server'),
    onPressed: () {
      print("On pressed btn server btn ");
      // Navigate to the second screen using a named route.
      Navigator.pushNamed(context, '/16server');
    },
  );
}

Widget btn17clientdserver(BuildContext context) {
  return RaisedButton(
    child: Text('client Server'),
    onPressed: () {
      print("On pressed btn client server btn ");
      // Navigate to the second screen using a named route.
      Navigator.pushNamed(context, '/17serverclient');
    },
  );
}

// Widget btn18multilanguage(BuildContext context) {
//   print("I am inside btn translate");
//   return RaisedButton(
//     child: Text('Translator'),
//     onPressed: () {
//       print("On pressed Translator btn ");
//       // Navigate to the second screen using a named route.
//       Navigator.pushNamed(context, '/18multilanguage');
//     },
//   );
// }

Widget btn19dartwebsocket(BuildContext context) {
  return RaisedButton(
    child: Text('DartWebSocket'),
    onPressed: () {
      print("On pressed Dartwebsocket btn ");
      // Navigate to the second screen using a named route.
      Navigator.pushNamed(context, '/19dartwebsocket');
    },
  );
}

Widget btn20socketconnection(BuildContext context) {
  print("I am inside btn Socket");

  return RaisedButton(
    child: Text('Simple TCP Socket'),
    onPressed: () {
      print("On pressed btn socket connection");
      // Navigate to the second screen using a named route.
      Navigator.pushNamed(context, '/20socketconnection');
    },
  );
}

Widget btn21bargraph(BuildContext context) {
  print("I am inside btn Simple text");

  return RaisedButton(
    child: Text('Bar Charts'),
    onPressed: () {
      print("On pressed btn bargraph");
      // Navigate to the second screen using a named route.
      Navigator.pushNamed(context, '/21bargraph');
    },
  );
}

Widget btn22linegraph(BuildContext context) {
  print("I am inside btn Simple text");

  return RaisedButton(
    child: Text('Line Charts'),
    onPressed: () {
      print("On pressed btn linegraph");
      // Navigate to the second screen using a named route.
      Navigator.pushNamed(context, '/22linegraph');
    },
  );
}

Widget btn23piegraph(BuildContext context) {
  print("I am inside btn Simple text");

  return RaisedButton(
    child: Text('Pie Charts'),
    onPressed: () {
      print("On pressed btn 3DBarGraph");
      // Navigate to the second screen using a named route.
      Navigator.pushNamed(context, '/23piegraph');
    },
  );
}

Widget btn24bar3dgraph(BuildContext context) {
  print("I am inside btn Simple text");

  return RaisedButton(
    child: Text('3D Bar Chart'),
    onPressed: () {
      print("On pressed btn 24bar3dgraph");
      // Navigate to the second screen using a named route.
      Navigator.pushNamed(context, '/24bar3dgraph');
    },
  );
}

Widget btn26scatterplot(BuildContext context) {
  print("I am inside btn Simple text");

  return RaisedButton(
    child: Text('3D ScatterPlot'),
    onPressed: () {
      print("On pressed btn 26scatterplot");
      // Navigate to the second screen using a named route.
      Navigator.pushNamed(context, '/26scatterplot');
    },
  );
}

Widget btn27flutterechartssimplebar(BuildContext context) {
  print("I am inside btn Simple text");

  return RaisedButton(
    child: Text('Flutter Echarts'),
    onPressed: () {
      print("On pressed btn 27flutterecharts");
      // Navigate to the second screen using a named route.
      Navigator.pushNamed(context, '/27flutterechartssimplebar');
    },
  );
}

Widget btn28filesave(BuildContext context) {
  print("I am inside btn Simple text");

  return RaisedButton(
    child: Text('FileSave'),
    onPressed: () {
      print("On pressed btn 28filesave");
      // Navigate to the second screen using a named route.
      Navigator.pushNamed(context, '/28filesave');
    },
  );
}

// Notes:
// void main() => runApp(MyApp());
// OR other way to represent
// void main() {
//   runApp(
//     MyApp(),
//   );
// }
