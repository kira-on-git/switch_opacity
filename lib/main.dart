import 'package:flutter/material.dart';
//import 'my_animated_opacity.dart';
//import 'animated_switcher.dart';
import 'opacity_timer.dart';
import 'opacity_widget.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Switch Opacity',
      home: Scaffold(body: OpacityWidget()),
    );
  }
}
