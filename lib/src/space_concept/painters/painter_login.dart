import 'package:flutter/material.dart';

class PainterLogin extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Color(0XFFFF296D);

    Path path = Path();
    path.moveTo(size.width, size.height * 0.15);
    path.lineTo(size.width * 0.7, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.65, size.height * 0.22,
        size.width * 0.7, size.height * 0.25);
    path.lineTo(size.width, size.height * 0.4);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
