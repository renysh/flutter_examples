import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'dart:math';

class HomeEcommercePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0XFF361988),
                  Color(0XFFA699CA),
                ],
                stops: [
                  0.0,
                  1.0,
                ],
              ),
            ),
          ),
          Positioned(
            right: 70,
            top: 70,
            child: CustomPaint(
              painter: BigRingPainter(),
            ),
          ),
          Positioned(
            top: 80,
            left: 15,
            child: CustomPaint(
              painter: SmallRingPainter(),
              child: Image.asset('assets/images/ecommerce/options.png'),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CustomPaint(
              painter: PolygonSolidPainter(),
              child: Container(
                // color: Colors.green,
                height: size.height * 0.45,
                width: size.width * 0.7,
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            right: 40,
            child: CustomPaint(
              painter: PolygonStrokePainter(),
              child: Container(
                // color: Colors.green,
                height: size.height * 0.45,
                width: size.width * 0.7,
              ),
            ),
          ),
          Container(
            width: size.width,
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/ecommerce/search.png'),
                        Text(
                          'LOGO',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    'Technology with the best options',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, size.width * 0.3, 0),
                    child: Text(
                      'Using Lorem Ipsum allows designers to put together layouts . . .',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 45.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            color: Color(0XFFE818C6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Technology',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            color: Color(0XFFA699CA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Fashion',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            color: Color(0XFFA699CA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Jewelry',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            color: Color(0XFFA699CA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Technology',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "What's new for you",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BigRingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      // ..color = Color(0XFFE818C6)
      ..strokeWidth = 15
      ..style = PaintingStyle.stroke
      ..shader = SweepGradient(
        colors: [
          Color(0XFFE818C6).withOpacity(0),
          Color(0XFFE818C6),
        ],
        tileMode: TileMode.mirror,
        startAngle: 3 * pi / 2,
        endAngle: 5 * pi / 2,
      ).createShader(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: 150,
        ),
      );

    Rect rect = new Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: 150);
    // angulo donde inicia
    double _startAngle = 0;
    // angulo de barrido
    double _sweepAngle = 2 * pi;

    canvas.drawArc(rect, _startAngle, _sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class SmallRingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      // ..color = Color(0XFFE818C6)
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..shader = SweepGradient(
        colors: [
          Color(0XFFA699CA).withOpacity(1),
          Color(0XFFE818C6).withOpacity(0),
          Color(0XFFA699CA).withOpacity(1),
        ],
        tileMode: TileMode.repeated,
        startAngle: 3 * pi / 2,
        endAngle: 10 * pi / 3,
      ).createShader(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: 50,
        ),
      );

    Rect rect = new Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: 50);
    // angulo donde inicia
    double _startAngle = 0;
    // angulo de barrido
    double _sweepAngle = 2 * pi;

    canvas.drawArc(rect, _startAngle, _sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class PolygonSolidPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
        Offset(size.width / 2, 0.0),
        Offset(size.width / 2, size.height),
        [
          Color(0XFFE818C6).withOpacity(1),
          Color(0XFFE818C6).withOpacity(0),
        ],
      );

    Path path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width * 0.2, 0);
    path.lineTo(size.width * 0.2, size.height * 0.3);
    path.lineTo(0, size.height * 0.5);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class PolygonStrokePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Color(0XFFA699CA)
      ..strokeWidth = 5;

    Path path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width * 0.2, 0);
    path.lineTo(size.width * 0.2, size.height * 0.3);
    path.lineTo(0, size.height * 0.5);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
