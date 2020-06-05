import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:convert';

class LineGraph extends StatefulWidget {
  final Widget child;

  LineGraph({Key key, this.child}) : super(key: key);

  _LineGraphState createState() => _LineGraphState();
}

class _LineGraphState extends State<LineGraph> {
  List<charts.Series<LKAS, int>> seriesLineData;

// 1. Change it String to int --> get this error: The getter 'time' isn't defined for the type 'List<LKAS>'.
  _generateData() async {
    final load =
    await DefaultAssetBundle.of(context).loadString("assets/data.json");
    var decoded = json.decode(load);
    List<LKAS> chartdata = [];
    for (var item in decoded) {
      chartdata.add(LKAS.fromJson(item));
    }

    seriesLineData.add(charts.Series(
      data: chartdata,
      domainFn: (LKAS chartdata, _) => int.parse(chartdata.time),
      // 2.domainFn: (LKAS LKAS, _) => LKAS.time, (Parse it with int)
      measureFn: (LKAS chartdata, _) => int.parse(chartdata.distance),
      // 3. measureFn: (LKAS LKAS, _) => int.parse(LKAS.distance), Parse it with int
      id: 'Performance',

    ));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    seriesLineData = List<charts.Series<LKAS, int>>();
    // 4. Change here String to int
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Center(child: Text('flutter charts')),
      ),
      body: Column(
        children: [
          Text(
            'Distance to Lane',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          seriesLineData.length > 0
              ? Expanded(
                  child: charts.LineChart(
                    seriesLineData,
                    animate: true,
                    animationDuration: Duration(seconds: 20),
                    behaviors: [
                      new charts.ChartTitle(
                        'Time,seconds',
                        behaviorPosition: charts.BehaviorPosition.bottom,
                        //5. Added Title to Axis
                      ),
                      new charts.ChartTitle(
                        'Distance,meter',
                        behaviorPosition: charts.BehaviorPosition.start,
                      )
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

class LKAS {
  String time;
  String distance;

  LKAS(this.time, this.distance);

  LKAS.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    distance = json['distance'];
  }
}
