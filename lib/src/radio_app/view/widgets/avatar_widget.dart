import 'package:flutter/material.dart';
import 'package:flutter_examples/src/radio_app/view/clippers/avatar_clipper.dart';

class AvatarWidget extends StatelessWidget {
  final double side;

  const AvatarWidget({@required this.side});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipPath(
        clipper: AvatarClipper(),
        child: Image.asset(
          'assets/images/radio_app/profile_picture.png',
          width: side,
        ),
      ),
    );
  }
}
