import 'dart:math';

import 'package:flutter/material.dart';

class WidgetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: CircularIndicator(
            totalColor: Colors.yellow,
            valueColor: Colors.blue,
            radius: 150,
            strokeWidth: 10,
            total: 100,
            value: 90,
          ),
        ),
      ),
    );
  }
}

class CircularIndicator extends StatefulWidget {
  const CircularIndicator(
      {@required this.radius,
      @required this.strokeWidth,
      @required this.total,
      @required this.value,
      @required this.totalColor,
      @required this.valueColor,
      this.durationAnimation = const Duration(seconds: 2)});

  final double radius;
  final double strokeWidth;
  final double total;
  final double value;
  final Color totalColor;
  final Color valueColor;
  final Duration durationAnimation;

  @override
  _CircularIndicatorState createState() => _CircularIndicatorState();
}

class _CircularIndicatorState extends State<CircularIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _moveAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: this.widget.durationAnimation);
    _moveAnimation = Tween<double>(begin: 0, end: this.widget.value)
        .animate(_animationController);
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.radius * 2,
      width: widget.radius * 2,
      child: AnimatedBuilder(
        animation: _moveAnimation,
        builder: (context, child) {
          return CustomPaint(
            painter: _CircularIndicatorPainter(
              totalColor: this.widget.totalColor,
              valueColor: this.widget.valueColor,
              strokeWidth: widget.strokeWidth,
              radius: widget.radius,
              total: widget.total,
              value: _moveAnimation.value,
            ),
            child: Center(
              child: Text(
                _moveAnimation.value.toStringAsFixed(0),
                style: TextStyle(
                  fontSize: this.widget.radius * 0.5,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CircularIndicatorPainter extends CustomPainter {
  final double strokeWidth;
  final double radius;
  final double total;
  final double value;
  final Color totalColor;
  final Color valueColor;

  _CircularIndicatorPainter({
    @required this.strokeWidth,
    @required this.radius,
    @required this.total,
    @required this.value,
    @required this.totalColor,
    @required this.valueColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _buildArcComplete(canvas, size);
    _buildArcValue(canvas, size);
  }

  _buildArcComplete(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = totalColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();

    Rect rect = new Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: radius);
    // angulo donde inicia
    double _startAngle = 0;
    // angulo de barrido
    double _sweepAngle = 2 * pi;

    path.addArc(rect, _startAngle, _sweepAngle);
    canvas.drawPath(path, paint);
  }

  _buildArcValue(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = valueColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();

    Rect rect = new Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: radius);
    // angulo donde inicia
    double _startAngle = 270 * pi / 180;
    // angulo de barrido
    double _sweepAngle = (value * 2 * pi) / total;

    path.addArc(rect, _startAngle, _sweepAngle);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
