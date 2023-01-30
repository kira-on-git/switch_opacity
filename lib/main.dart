import 'package:flutter/material.dart';
import 'opacity_widget.dart';

void main() {
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
