import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SquareAnimated(),
     ),
   );
  }
}

class SquareAnimated extends StatefulWidget {
  @override
  _SquareAnimatedState createState() => _SquareAnimatedState();
}

class _SquareAnimatedState extends State<SquareAnimated> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<double> rotation;
  Animation<double> opacityAnimation;

  @override
  void initState() { 
    super.initState();
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 3000));

    rotation = Tween(begin: 0.0, end: 2 * Math.pi).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );

    opacityAnimation = Tween(begin: 0.1, end: 1.0).animate(controller);

    controller.addListener(() {
      if(controller.status == AnimationStatus.completed) {
        controller.reverse();
      }
      //  else if(controller.status == AnimationStatus.dismissed) {
      //   controller.forward();
      // }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    //  Play
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget child) {
        return Transform.rotate(
          angle: rotation.value,
          child: Opacity(
            opacity: opacityAnimation.value,
            child: child,
          )
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.blue
      ),
    );
  }
}