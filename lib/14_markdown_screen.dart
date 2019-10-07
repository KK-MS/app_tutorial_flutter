import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';


class FirstParameter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Index();
  }
}


class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

const String markdowndata="""



## __Initial braking pressure__

__Definition:__ The initial brake pressure describes the resulting jerk that occurs with initiation of a braking operation is passed on to the driver.

__Driving manoeuvres__:Target and Hunter are on the same lane and straight road. Hunter approaches at different speeds to the regulated to 100 km / h target.

__Speed__:20 km / h to 60 km/h

__Distance Step__:Shortest and Longest

__Notes on Evaluation__:There should be a noticeable but to the driving situation appropriate initial brake pressure must be available in order to allow the driver of the changed situation to give feedback accordingly. A positive assessment is a large. Initial brake pressure at high differential speeds between Target and Hunter. With low differential speeds a large. Initial brake pressure negative. It must be based on uniformity of the reaction behavior. For large fluctuations the result should be judged negatively as the reliability of the system decreases.

## __Final brake pressure__  

__Definition:__ TheFinal brake pressure describes the jerk that is passed on to the driver when the brake is released.

__Driving manoeuvres:__ Target and Hunter are on the same lane and straight road. Hunter approaches at different speeds to the regulated to 100 km / h target.

__Speed:__ 20 km / h to 60 km/h

__Distance Step:__ Shortest and Longest


__Notes on Evaluation__:In order to reduce the final brake pressure a continuously decreasing Brake pressure desired. A uniformity of the reaction pressure is required.To respect the privacy of our guests. If there are large fluctuations the result is negative.as the reliability of the system decreases.


## Decceleration curve 
 
__Definition:__ The deceleration curve describes the harmony of a braking.

__Driving manoeuvres__: Target and Hunter are on the same lane and straight road. Hunter approaches at different speeds to the regulated to 100 km / h target.

__Speed__: 20 km/h to 60 km/h   

__Distance Step:__ Shortest and Longest

__Notes on Evaluation:__  It has to be a uniformity of reaction behavior. For large fluctuations and strong brake application the result is necessarily a bad thing as the reliability of the system decreases.


## Object detection distance

__Definition:__  The object recognition distance describes the distance to the target at a first noticeable delay.

__Driving manoeuvres__: Target and Hunter are on the same lane and straight road. Hunter approaches at different speeds to the regulated to 100 km / h target.

__Speed__: 20 km/h to 60 km/h   

__Distance Step:__ Shortest and Longest

__Notes on Evaluation:__ The object detection distance should be at all speed levels remain constant. In the event of large fluctuations the result is negative at as the reliability of the system decreases.


##  Min.dynamic distance

__Definition:__ This criterion describes the minimum distance between the target and Hunter occurring during the initial adjustment.

__Driving manoeuvres__: Target and Hunter are on the same lane and straight road. Hunter approaches at different speeds to the regulated to 100 km / h target.

__Speed__: 20 km/h to 60 km/h    

__Distance Step:__  Shortest and Longest

__Notes on Evaluation:__ The minimum distance should correspond to the expectations of the driver. it is important to ensure that the reaction behaviour is uniform. if there are large fluctuations the result should be judged negatively as the reliability of the system drops. it is important to ensure a good feeling of safety.




##  Time to reach the stationary distance

__Definition:__ This criterion describes the time until reaching the steady interval after reaching the minimum distance.

__Driving manoeuvres__: Target and Hunter are on the same lane and straight road. Hunter approaches at different speeds to the regulated to 100 km / h target.

__Speed__: 20 km/h to 80 km/h   

__Distance Step:__ Shortest and Longest

__Notes on Evaluation:__ It has to be a uniformity of reaction behavior. For large fluctuations the result is necessarily a bad thing as the reliability of the system decreases. 





""";

class _IndexState extends State<Index> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Flutter Markdown")),
      ),
      body: Center(
        child: Markdown(
          data: markdowndata,

        ),
      ),

    );

  }
}

