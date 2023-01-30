import 'package:flutter/material.dart';

//TODO: make a getter & setter for opacity

class LogoFade extends StatefulWidget {
  const LogoFade({super.key});

  @override
  State<LogoFade> createState() => LogoFadeState();
}

class LogoFadeState extends State<LogoFade> {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
    print(opacityLevel);
  }

  Future<String> resetAdvice() async {
    return 'etwas';
  }

  Future waitForMe() async {
    print('Started.');
    return Future.delayed(Duration(seconds: 4), () {
      //advice = 'default';
      print('Done');
    });
  }

  void myAsyncFunc() async {
    String advice = await resetAdvice();
    // wenn advice != null
    print(advice);
    await waitForMe();
    // in 5 secunden 'I was waiting here'
    print('I was waiting here: $advice');
    if (opacityLevel == 0.0) {
      opacityLevel = 1.0;
      advice = 'default';
      print('Widget is rebuilded, advice = $advice');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Widget is builded, opacity = $opacityLevel');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedOpacity(
          opacity: opacityLevel,
          duration: const Duration(seconds: 3),
          child: const FlutterLogo(),
        ),
        const SizedBox(height: 50),
        ElevatedButton(
          onPressed: () {
            _changeOpacity();
            myAsyncFunc();
          },
          child: const Text('Fade Logo'),
        ),
      ],
    );
  }
}

// void myAsyncFunc() async {
//   // Zusatz: async

//   print('warte bis opacity 0 wird ${resetAdvice()}');

//   String advice = await resetAdvice();
//   // wenn advice != null
//   print(advice);

//   await waitForMe();
//   // in 5 secunden 'I was waiting here'
//   print('I was waiting here: $advice');
// }

// Future<String> resetAdvice() async {
//   return 'etwas';
// }





// void didUpdateWidget(FlutterLogo oldWidget){
//   super.didUpdateWidget(oldWidget);
//   opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;

//   }

// class MyAnimatedOpacity extends AnimatedOpacity {
//   const MyAnimatedOpacity({super.key});

//   @override
//   State<MyAnimatedOpacity> createState() => _MyAnimatedOpacityState();
// }

// class _MyAnimatedOpacityState extends State<MyAnimatedOpacity> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }