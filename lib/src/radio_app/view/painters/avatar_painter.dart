import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class AvatarPainter extends CustomPainter {
  final ui.Image image;

  AvatarPainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = 30;
    print(size);
    Paint paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.color = Colors.pink;

    Path path = Path();
    path.moveTo(0, size.height * 0.25);
    Offset p1 = Offset(size.width - 2 * radius, size.height / 2 - radius);
    Offset p2 = Offset(size.width - 2 * radius, size.height / 2 + radius);
    path.quadraticBezierTo(0, 0, size.width * 0.25, size.height * 0.15);
    path.lineTo(p1.dx, p1.dy);
    path.quadraticBezierTo(size.width, size.height / 2, p2.dx, p2.dy);

    path.lineTo(size.width * 0.25, size.height * 0.85);

    path.quadraticBezierTo(0, size.height, 0, size.height * 0.75);

    path.close();

    canvas.drawImage(image, Offset(0, 0), paint);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
