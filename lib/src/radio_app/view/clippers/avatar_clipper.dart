import 'package:flutter/material.dart';

class AvatarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double radius = 30;
    final path = Path();
    path.moveTo(0, size.height * 0.25);
    Offset p1 = Offset(size.width - 2 * radius, size.height / 2 - radius);
    Offset p2 = Offset(size.width - 2 * radius, size.height / 2 + radius);
    path.quadraticBezierTo(0, 0, size.width * 0.25, size.height * 0.15);
    path.lineTo(p1.dx, p1.dy);
    // path.arcToPoint(p2, radius: Radius.circular(radius));
    path.quadraticBezierTo(size.width, size.height / 2, p2.dx, p2.dy);

    path.lineTo(size.width * 0.25, size.height * 0.85);

    path.quadraticBezierTo(0, size.height, 0, size.height * 0.75);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
