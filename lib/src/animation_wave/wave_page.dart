import 'package:flutter/material.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' as Vector;

class WavePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Stack(
        children: <Widget>[
          ColorCurveBody(
              size: size, xOffset: 20, yOffset: 50, color: Colors.white),
        ],
      ),
    );
  }
}

class ColorCurveBody extends StatefulWidget {
  final Size size;
  final int xOffset;
  final int yOffset;
  final Color color;

  ColorCurveBody(
      {Key key, @required this.size, this.xOffset, this.yOffset, this.color})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _ColorCurveBodyState();
  }
}

class _ColorCurveBodyState extends State<ColorCurveBody>
    with TickerProviderStateMixin {
  AnimationController animationController;
  List<Offset> animList1 = [];

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 11));
    animationController.addListener(() {
      animList1.clear();
      for (int i = -widget.xOffset; i <= widget.size.width.toInt(); i++) {
        animList1.add(Offset(
            i.toDouble() + widget.xOffset,
            cos((animationController.value * 360 - i) %
                        360 *
                        Vector.degrees2Radians) *
                    20 +
                50 +
                widget.yOffset));
      }
    });
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      child: new AnimatedBuilder(
        animation: new CurvedAnimation(
          parent: animationController,
          curve: Curves.easeInOut,
        ),
        builder: (context, child) => new ClipPath(
          child: widget.color == null
              ? Image.network(
                  '',
                  width: widget.size.width,
                  height: widget.size.height,
                  fit: BoxFit.cover,
                )
              : new Container(
                  width: widget.size.width,
                  height: widget.size.height,
                  color: widget.color,
                ),
          clipper: new WaveClipper(animationController.value, animList1),
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final double animation;

  List<Offset> waveList1 = [];

  WaveClipper(this.animation, this.waveList1);

  @override
  Path getClip(Size size) {
    Path path = new Path();

    path.addPolygon(waveList1, false);

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(WaveClipper oldClipper) =>
      animation != oldClipper.animation;
}
