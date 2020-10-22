import 'package:flutter/material.dart';

class ButtonControlPainter extends CustomPainter {
  final Color backgroundColor;

  ButtonControlPainter(this.backgroundColor);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height * 0.333);
    path.quadraticBezierTo(
        0, size.height * 0.25, size.width * 0.125, size.height * 0.1833);
    path.lineTo(size.width * 0.4, size.height * 0.05);
    path.quadraticBezierTo(
        size.width / 2, 0, size.width * 0.6, size.height * 0.05);
    path.lineTo(size.width * 0.875, size.height * 0.1833);
    path.quadraticBezierTo(
        size.width, size.height * 0.25, size.width, size.height * 0.333);
    path.lineTo(size.width, size.height * 0.666);
    path.quadraticBezierTo(size.width, size.height * 0.75, size.width * 0.875,
        size.height * 0.8166);
    path.lineTo(size.width * 0.6, size.height * 0.95);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width * 0.4, size.height * 0.95);
    path.lineTo(size.width * 0.125, size.height * 0.8166);
    path.quadraticBezierTo(0, size.height * 0.75, 0, size.height * 0.666);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
