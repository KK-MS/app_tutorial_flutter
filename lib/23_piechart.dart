import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:convert';

class PieGraph extends StatefulWidget {
  final Widget child;

  PieGraph({Key key, this.child}) : super(key: key);

  _PieGraphState createState() => _PieGraphState();
}

class _PieGraphState extends State<PieGraph> {
  List<charts.Series<LKAS, String>> seriesPieData;

  _generateData() async {
    final load =
        await DefaultAssetBundle.of(context).loadString("assets/data.json");

    var decoded = json.decode(load);
    List<LKAS> chartdata = [];
    for (var item in decoded) {
      chartdata.add(LKAS.fromJson(item));
    }

    seriesPieData.add(charts.Series(
      data: chartdata,
      //domainFn: (LKAS chartdata, _) => int.parse(chartdata.time),
      domainFn: (LKAS chartdata, _) => chartdata.time,
      measureFn: (LKAS chartdata, _) => int.parse(chartdata.distance),
      // measureFn: (LKAS chartdata, _) => chartdata.distance,
      id: 'Performance',
      labelAccessorFn: (LKAS column, _) => '${column.distance}',
    ));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    seriesPieData = List<charts.Series<LKAS, String>>();
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
          if (seriesPieData.length > 0)
            Expanded(
              child: charts.PieChart(
                seriesPieData,
                animate: true,
                animationDuration: Duration(seconds: 5),

                // domainAxis: new charts.OrdinalAxisSpec(
                //viewport: new charts.OrdinalViewport('AePS', 9),
                // ),
                behaviors: [
                  new charts.DatumLegend(
                    outsideJustification:
                        charts.OutsideJustification.endDrawArea,
                    horizontalFirst: false,
                    desiredMaxRows: 2,
                    cellPadding:
                        new EdgeInsets.only(right: 4.0, bottom: 4.0, top: 4.0),
                    entryTextStyle: charts.TextStyleSpec(
                        color: charts.MaterialPalette.teal.shadeDefault,
                        fontFamily: 'Georgia',
                        fontSize: 18),
                  )
                ],
              ),
            )
          else
            Container(),
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
