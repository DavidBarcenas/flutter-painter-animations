import 'package:flutter/material.dart';
import 'package:custom_painter/src/widgets/radial_progress.dart';

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  double percentage = 10;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double square = size.width * 0.4;

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              percentage += 10;
              if (percentage > 100) {
                percentage = 0;
              }
            });
          },
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CustomRadialProgress(
                    square: square,
                    percentage: percentage,
                    color: Colors.deepOrange),
                CustomRadialProgress(
                    square: square,
                    percentage: percentage,
                    color: Colors.deepPurpleAccent),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CustomRadialProgress(
                    square: square,
                    percentage: percentage,
                    color: Colors.blueAccent),
                CustomRadialProgress(
                    square: square,
                    percentage: percentage,
                    color: Colors.pinkAccent),
              ],
            )
          ],
        ));
  }
}

class CustomRadialProgress extends StatelessWidget {
  final double square;
  final double percentage;
  final Color color;

  const CustomRadialProgress(
      {@required this.square, @required this.percentage, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: square,
      height: square,
      // color: Colors.red,
      child: RadialProgress(
        percentage: percentage,
        selectedColor: color,
      ),
    );
  }
}
