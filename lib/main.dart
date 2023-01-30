import 'package:flutter/material.dart';
//import 'my_animated_opacity.dart';
import 'opacity_widget.dart';
//import 'dart:async';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Switch Opacity',
      home: OpacityWidget(),
    );
  }
}
