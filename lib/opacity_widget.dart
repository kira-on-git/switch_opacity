import 'package:flutter/material.dart';
import 'dart:async';

class OpacityWidget extends StatefulWidget {
  const OpacityWidget({super.key});

  @override
  State<OpacityWidget> createState() => _OpacityWidgetState();
}

class _OpacityWidgetState extends State<OpacityWidget> {
  bool _visible = true;
  void makeUnvisible() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 50),
            AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: const Duration(seconds: 3),
              curve: Curves.linear,
              child: Container(
                color: Colors.green,
                height: 100,
                width: 100,
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
                onPressed: makeUnvisible, child: const Icon(Icons.add)),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

void main() async {
  // Zusatz: async

  print('warte bis opacity 0 wird ${resetAdvice()}');

  String advice = await resetAdvice();
  // wenn advice != null
  print(advice);

  await waitForMe();
  // in 5 secunden 'I was waiting here'
  print('I was waiting here: $advice');
}

Future<String> resetAdvice() async {
  return 'etwas';
}

Future waitForMe() async {
  print('Started.');
  return Future.delayed(Duration(seconds: 5), () {
    //advice = 'default';
    print('Done');
  });
}
