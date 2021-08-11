import 'package:flutter/material.dart';
import 'package:pick_image_demo/pick_image_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: PickImageClass(),
    );
  }
}
