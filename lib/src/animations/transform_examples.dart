import 'package:flutter/material.dart';
// import 'dart:math' as math;

class TransformExamples extends StatefulWidget {
  @override
  _TransformExamplesState createState() => _TransformExamplesState();
}

class _TransformExamplesState extends State<TransformExamples> {
  double x = 0;
  double y = 0;
  double z = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform(
          transform: Matrix4.identity()
            ..rotateX(x)
            ..rotateY(y)
            ..rotateZ(z)
            ..setEntry(3, 2, 0.002)
            ..setEntry(0, 3, 0.002)
            ..setEntry(1, 3, 0.002),
          alignment: FractionalOffset.center,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                y = y - details.delta.dx / 100;
                x = x + details.delta.dy / 100;
              });
            },
            child: Container(
              color: Colors.red,
              height: 200.0,
              width: 200.0,
            ),
          ),
        ),
      ),
    );
  }
}
