import 'package:flutter/material.dart';
import 'package:flutter_examples/src/animations/transform_examples.dart';

class Animations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'SF Pro Display',
              bodyColor: Colors.white,
            ),
      ),
      home: TransformExamples(),
    );
  }
}
