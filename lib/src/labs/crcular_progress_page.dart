import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double percentage = 10;
  double newPercentage = 10;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));
    controller.addListener(() {
      // print('valor controller: ${controller.value}');
      setState(() {
        this.percentage =
            lerpDouble(this.percentage, this.newPercentage, controller.value);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          backgroundColor: Colors.deepOrange,
          onPressed: () => setState(() {
                this.percentage = this.newPercentage;
                this.newPercentage += 10;
                if (this.newPercentage > 100) {
                  this.newPercentage = 0;
                  this.percentage = 0;
                }
                controller.forward(from: 0.0);
              })),
      body: Center(
        child: Stack(children: [
          Container(
            width: 300,
            height: 300,
            // color: Colors.pinkAccent,
            child: CustomPaint(painter: _RadialProgressPainter(percentage)),
          ),
          Container(
            width: 300,
            height: 300,
            alignment: Alignment.center,
            child: Text(
              this.newPercentage.round().toString(),
              style: TextStyle(fontSize: 45.0, color: Colors.grey),
            ),
          )
        ]),
      ),
    );
  }
}

class _RadialProgressPainter extends CustomPainter {
  final percentage;

  _RadialProgressPainter(this.percentage);

  // Circle
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final c = new Offset(size.width * 0.5, size.height * 0.5);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(c, radius, paint);
    // Arco
    final paintArc = new Paint()
      ..strokeWidth = 10
      ..color = Colors.deepOrange
      ..style = PaintingStyle.stroke;

    // filling progress
    double arcAngle = 2 * pi * (percentage / 100);
    canvas.drawArc(Rect.fromCircle(center: c, radius: radius), -pi / 2,
        arcAngle, false, paintArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
