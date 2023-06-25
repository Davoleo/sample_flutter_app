import 'package:flutter/material.dart';
import 'package:implicit_animations/shape_shifting_demo.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: AnimatedContainerDemo());
  }
}

void main() {
  runApp(
    const MyApp(),
  );
}
