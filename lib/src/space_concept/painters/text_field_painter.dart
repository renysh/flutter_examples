import 'package:flutter/material.dart';

class TextFieldPainter extends CustomPainter {
  final Color borderColor;

  TextFieldPainter(this.borderColor);

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = 10.0;
    // final rect = Offset.zero & size;
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    paint.color = borderColor;

    final double desp = 5;

    // rectangle
    final Offset p1 = Offset(0, radius);
    final Offset p2 = Offset(radius, 0);
    final Offset p3 = Offset(size.width - radius - desp, 0);
    final Offset p4 = Offset(size.width - desp, radius);
    final Offset p5 = Offset(size.width - desp, size.height - radius);
    final Offset p6 = Offset(size.width - radius - desp, size.height);
    final Offset p7 = Offset(radius, size.height);
    final Offset p8 = Offset(0, size.height - radius);

    final path = Path(); //..addRect(rect);
    path.moveTo(p1.dx, p1.dy);
    path.arcToPoint(p2, radius: Radius.circular(radius));
    path.lineTo(p3.dx, p3.dy);
    path.arcToPoint(p4, radius: Radius.circular(radius));
    path.lineTo(p5.dx, p5.dy);
    path.arcToPoint(p6, radius: Radius.circular(radius));
    path.lineTo(p7.dx, p7.dy);
    path.arcToPoint(p8, radius: Radius.circular(radius));
    path.lineTo(p1.dx, p1.dy);

    canvas.drawPath(path, paint);

    final Offset p1Shadow = Offset(desp, radius);
    final Offset p2Shadow = Offset(radius + desp, 0);
    final Offset p3Shadow = Offset(size.width - radius, 0);
    final Offset p4Shadow = Offset(size.width, radius);
    final Offset p5Shadow = Offset(size.width, size.height - radius);
    final Offset p6Shadow = Offset(size.width - radius, size.height);
    final Offset p7Shadow = Offset(radius + desp, size.height);
    final Offset p8Shadow = Offset(desp, size.height - radius);

    final pathShadow = Path(); //..addRect(rect);
    pathShadow.moveTo(p1Shadow.dx, p1Shadow.dy);
    pathShadow.arcToPoint(p2Shadow, radius: Radius.circular(radius));
    pathShadow.lineTo(p3Shadow.dx, p3Shadow.dy);
    pathShadow.arcToPoint(p4Shadow, radius: Radius.circular(radius));
    pathShadow.lineTo(p5Shadow.dx, p5Shadow.dy);
    pathShadow.arcToPoint(p6Shadow, radius: Radius.circular(radius));
    pathShadow.lineTo(p7Shadow.dx, p7Shadow.dy);
    pathShadow.arcToPoint(p8Shadow, radius: Radius.circular(radius));
    pathShadow.lineTo(p1Shadow.dx, p1Shadow.dy);
    canvas.drawShadow(pathShadow, borderColor.withAlpha(100), 3.0, false);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
