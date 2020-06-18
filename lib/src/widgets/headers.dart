import 'package:flutter/material.dart';

class SquareHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      color: Color(0xff615aab)
    );
  }
}


class BorderRadiusHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      decoration: BoxDecoration(
        color: Color(0xff615aab),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70), 
          bottomRight: Radius.circular(70)
        )
      ),
    );
  }
}


class DiagonalHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615aab),
      child: CustomPaint(
        painter: _DiagonalHeaderPainter()
      ),
    );
  }
}

class _DiagonalHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();
    paint.color = Color(0xff615aab);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 1;

    final path = Path();
    path.moveTo(0, size.height * 0.40);
    path.lineTo(size.width, size.height * 0.35);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    // path.lineTo(0, size.height * 0.5);

    canvas.drawPath(path, paint);
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
   return true;
  }

}

class TriangleHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _TriangleHeaderPainter(),
      ),
    );
  }
}

class _TriangleHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final paint = Paint();
    paint.color = Color(0xff615aab);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10;

    final path = Path();
    path.lineTo(w, h);
    path.lineTo(w, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


class PeakHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _PeakHeaderPainter(),
      ),
    );
  }
}

class _PeakHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final paint = Paint();
    paint.color = Color(0xff615aab);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10;

    final path = Path();
    path.lineTo(0, h * 0.25);
    path.lineTo(w * 0.5, h * 0.35);
    path.lineTo(w, h * 0.25);
    path.lineTo(w, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}


class CurveHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _CurveHeaderPainter(),
      ),
    );
  }
}

class _CurveHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final paint = Paint();
    paint.color = Color(0xff615aab);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10;

    final path = Path();
    path.lineTo(0, h * 0.25);
    path.quadraticBezierTo(w * 0.5, h * 0.45, w, h * 0.25);
    path.lineTo(w, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}