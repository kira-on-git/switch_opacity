// ignore_for_file: avoid_print

import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';

/**** LISTE ****/

List<String> adviceBank = ['Apfel', 'Birne', 'Aprikose', 'Melone', 'Kiwi'];
String advice = '';

/**** WIDGET ****/
class OpacityWidget extends StatefulWidget {
  const OpacityWidget({super.key});

  @override
  State<OpacityWidget> createState() => _OpacityWidgetState();
}

class _OpacityWidgetState extends State<OpacityWidget> {
  double _opacity = 1.0;
  final int _duration = 8;

/**** FADE IN & OUT ****/
  void makeUnvisible() {
    setState(() => _opacity = _opacity == 0.0 ? 1.0 : 0.0);
    print('State changed');
  }

/**** FUTURE ****/
  Future resetOpacity() async {
    print('Future started--------->>>');
    return Future.delayed(Duration(seconds: _duration), () {
      if (_opacity == 0) {
        setState(() {
          _opacity = 1.0;
          advice = '';
        });
      }
      print('Future arrived -------<<<<<');
      print('_opasity was reseted to $_opacity');
      print("advice was reseted to ''");
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build Element tree');
    print('_opacity = $_opacity');
    print("advice = '' ");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: 50),
          AnimatedOpacity(
            opacity: _opacity,
            duration: Duration(seconds: _duration),
            child: Container(
              color: Colors.pink.shade400,
              height: 100,
              width: 100,
              child: Center(
                child: Text(
                  advice,
                  //textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          /**** BUTTON ****/
          ElevatedButton(
              onPressed: () {
                print('Button pressed------*****');
                advice = adviceBank[Random().nextInt(adviceBank.length)];
                makeUnvisible();
                print('new _opacity = $_opacity');
                resetOpacity();
              },
              child: const Text('Fade Out & In')),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
