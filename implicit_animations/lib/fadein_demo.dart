import 'package:flutter/material.dart';

const owlUrl =
    'https://raw.githubusercontent.com/flutter/website/main/src/assets/images/docs/owl.jpg';

class FadeInDemo extends StatefulWidget {
  const FadeInDemo({Key? key}) : super(key: key);

  @override
  State<FadeInDemo> createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {
  double opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: <Widget>[
          Image.network(owlUrl),
          TextButton(
              child: const Text(
                'Show Details',
                style: TextStyle(color: Colors.blueAccent),
              ),
              onPressed: () => setState(() {
                opacity = 1;
              })),
          AnimatedOpacity(
            duration: const Duration(seconds: 2),
            opacity: opacity,
            child: const Column(
              children: [
                Text('Type: Owl'),
                Text('Age: 39'),
                Text('Employment: None'),
              ],
            ),
          )
        ]),
      ),
    );
  }
}