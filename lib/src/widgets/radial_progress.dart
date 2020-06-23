import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final percentage;

  RadialProgress({@required this.percentage});

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double prevPercentage;

  @override
  void initState() {
    prevPercentage = widget.percentage;
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final percentageAnimate = widget.percentage - prevPercentage;
    prevPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: controller,
      // child: child,
      builder: (BuildContext context, Widget child) {
        return Container(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
                painter: _RadialProgressPainter(
                    (widget.percentage - percentageAnimate) +
                        (percentageAnimate * controller.value))));
      },
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
