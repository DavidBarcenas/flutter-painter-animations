import 'dart:math';

import 'package:flutter/material.dart';

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          // color: Colors.pinkAccent,
          child: CustomPaint(painter: _RadialProgressPainter(50)),
        ),
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
