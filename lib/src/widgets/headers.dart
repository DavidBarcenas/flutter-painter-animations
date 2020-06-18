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
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70), bottomRight: Radius.circular(70))
      ),
    );
  }
}

