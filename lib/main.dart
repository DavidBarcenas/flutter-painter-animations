import 'package:flutter/material.dart';
import 'package:custom_painter/src/pages/progress_page.dart';
// import 'package:custom_painter/src/pages/animations/animations_page.dart';
// import 'package:custom_painter/src/pages/designs/headers_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Designs and Animations',
      home: ProgressPage(),
    );
  }
}
