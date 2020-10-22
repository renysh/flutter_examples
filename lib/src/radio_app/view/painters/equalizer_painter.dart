import 'package:flutter/material.dart';

class EqualizerPainter extends CustomPainter {
  final bool selected;
  final Color pointsColor;

  EqualizerPainter(this.selected, this.pointsColor);

  @override
  void paint(Canvas canvas, Size size) {
    final initialPoint = Offset(0, size.height * 0.33);
    final endPoint = Offset(size.width, size.height * 0.33);

    Paint paintLine = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = selected ? Colors.white : Color(0XFFFFFFFF).withOpacity(0.3)
      ..strokeJoin = StrokeJoin.round;

    Path path = Path();
    path.moveTo(initialPoint.dx, initialPoint.dy);
    path.cubicTo(
      size.width * 0.06,
      size.height * 0.25,
      size.width * 0.1,
      size.height * 1.1,
      size.width * 0.1829,
      size.height * 0.5,
    );

    path.cubicTo(
      size.width * 0.32,
      -size.height * 0.8,
      size.width * 0.3,
      size.height * 1.3,
      size.width * 0.4371,
      size.height * 0.5,
    );

    path.cubicTo(
      size.width * 0.55,
      -size.height * 0.1,
      size.width * 0.55,
      size.height * 1.7,
      size.width * 0.6857,
      size.height * 0.5,
    );

    path.cubicTo(
      size.width * 0.8,
      -size.height * 0.1,
      size.width * 0.8,
      size.height * 1.3,
      size.width * 0.9143,
      size.height * 0.5,
    );

    path.quadraticBezierTo(
      size.width * 0.94,
      size.height * 0.35,
      endPoint.dx,
      endPoint.dy,
    );

    Paint paintCircle = Paint();
    paintCircle.color = pointsColor;

    canvas.drawPath(path, paintLine);

    canvas.drawCircle(initialPoint, 5, paintCircle);
    canvas.drawCircle(endPoint, 5, paintCircle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
