import 'package:flutter/material.dart';
import 'package:flutter_examples/src/radio_app/view/painters/button_control_painter.dart';

class ControlButton extends StatelessWidget {
  final double width;
  final double height;
  final Widget icon;
  final Color backgroundColor;

  const ControlButton(
      {this.width, this.height, this.icon, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ButtonControlPainter(backgroundColor),
      child: Container(
        height: height,
        width: width,
        child: icon,
      ),
    );
  }
}
