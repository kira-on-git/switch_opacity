// ignore_for_file: avoid_print

import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';
/**** LISTE ****/

List<String> adviceBank = ['Apfel', 'Birne', 'Aprikose', 'Melone', 'Kiwi'];
String advice = 'default';

/**** WIDGET ****/
class VisibilityWidget extends StatefulWidget {
  const VisibilityWidget({super.key});

  @override
  State<VisibilityWidget> createState() => _VisibilityWidgetState();
}

class _VisibilityWidgetState extends State<VisibilityWidget> {
  bool _visible = true;
  final int _duration = 3;

/**** FADE IN & OUT ****/

/**** FUTURE ****/
  Future resetVisible() async {
    print('Future started--------->>>');
    return Future.delayed(Duration(seconds: _duration), () {
      if (_visible == true) {
        setState(() {
          _visible = true;
          advice = '';
        });
      }
      print('Future arrived -------<<<<<');
      print("advice was reseted to ''");
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build Element tree');
    print("advice = '' ");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: 50),
          Visibility(
            visible: _visible,
            // maintainAnimation: true,
            child: Container(
              color: Colors.pink.shade400,
              height: 100,
              width: 100,
              child: Center(
                child: Text(
                  advice,
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

                setState(() {
                  advice = adviceBank[Random().nextInt(adviceBank.length)];
                });
                resetVisible();
              },
              child: const Text('next word')),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
