// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
//import 'dart:async';

class OpacityWidget extends StatefulWidget {
  const OpacityWidget({super.key});

  @override
  State<OpacityWidget> createState() => _OpacityWidgetState();
}

class _OpacityWidgetState extends State<OpacityWidget> {
  double _opacity = 1.0;

  void makeUnvisible() {
    setState(() => _opacity = _opacity == 0.0 ? 1.0 : 0.0);
    print('State changed');
  }

  @override
  Widget build(BuildContext context) {
    print('build Element tree');
    print('_opacity = $_opacity');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: 50),
          AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(seconds: 3),
            alwaysIncludeSemantics: true,
            curve: Curves.linear,
            child: Container(
              color: Colors.green,
              height: 100,
              width: 100,
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
              onPressed: () {
                print('*****----Button pressed----*****');
                makeUnvisible();
                print('new _opacity = $_opacity');
              },
              child: const Text('Fade Out')),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
