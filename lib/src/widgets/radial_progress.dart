import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final percentage;
  final Color selectedColor;
  final Color secondaryColor;

  RadialProgress(
      {@required this.percentage,
      this.selectedColor = Colors.deepOrange,
      this.secondaryColor = Colors.grey});

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
        return Stack(
          children: <Widget>[
            Container(
                width: double.infinity,
                height: double.infinity,
                child: CustomPaint(
                    painter: _RadialProgressPainter(
                        (widget.percentage - percentageAnimate) +
                            (percentageAnimate * controller.value),
                        widget.selectedColor,
                        widget.secondaryColor))),
            Container(
              alignment: Alignment.center,
              child: (Text(widget.percentage.round().toString() + '%',
                  style:
                      TextStyle(fontSize: 45.0, color: widget.selectedColor))),
            )
          ],
        );
      },
    );
  }
}

class _RadialProgressPainter extends CustomPainter {
  final percentage;
  final color;
  final secodaryColor;
  _RadialProgressPainter(this.percentage, this.color, this.secodaryColor);

  // Circle
  @override
  void paint(Canvas canvas, Size size) {
    final gradient = LinearGradient(
        colors: [Color(0xffc012ff), Color(0xff6d05e8), Colors.red]);

    final rect = Rect.fromCircle(center: Offset(0, 0), radius: 180);

    final paint = new Paint()
      ..strokeWidth = 4
      ..color = secodaryColor
      ..style = PaintingStyle.stroke;

    final c = new Offset(size.width * 0.5, size.height * 0.5);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(c, radius, paint);
    // Arco
    final paintArc = new Paint()
      ..strokeWidth = 10
      ..color = color
      // ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
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
