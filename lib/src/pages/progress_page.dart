import 'package:flutter/material.dart';
import 'package:custom_painter/src/widgets/radial_progress.dart';

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  double percentage = 10;
  double square = 300.0;

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          width: square,
          height: square,
          // color: Colors.red,
          child: RadialProgress(percentage: percentage),
        ),
      ),
    );
  }
}
