import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:provider/provider.dart';

import 'package:flutter_examples/src/radio_app/bloc/station_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    Provider.of<StationProvider>(context, listen: false).loadStations();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF01012A),
      body: Row(
        children: [
          NavigationRail(
            minWidth: 79,
            backgroundColor: Color(0XFF080833),
            labelType: NavigationRailLabelType.all,
            selectedLabelTextStyle: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            unselectedLabelTextStyle: TextStyle(
              fontSize: 20.0,
              color: Colors.white.withOpacity(0.3),
            ),
            leading: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Image.asset('assets/images/radio_app/icon_login.png'),
                  height: 33,
                ),
              ],
            ),
            groupAlignment: 0.0,
            destinations: [
              NavigationRailDestination(
                icon: SizedBox.shrink(),
                label: LabelDestination(
                  selected: _selectedIndex == 0,
                  text: 'All Stations',
                ),
              ),
              NavigationRailDestination(
                icon: SizedBox.shrink(),
                label: LabelDestination(
                  selected: _selectedIndex == 1,
                  text: 'Favorites',
                ),
              ),
              NavigationRailDestination(
                icon: SizedBox.shrink(),
                label: LabelDestination(
                  selected: _selectedIndex == 2,
                  text: 'Popular',
                ),
              ),
            ],
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            selectedIndex: _selectedIndex,
          ),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                AllStationsPage(),
                Container(
                  child: Center(
                    child: Text('selectedIndex: $_selectedIndex'),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text('selectedIndex: $_selectedIndex'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LabelDestination extends StatelessWidget {
  final bool selected;
  final String text;

  const LabelDestination({@required this.selected, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RotatedBox(
          child: Text(text),
          quarterTurns: -1,
        ),
        this.selected
            ? Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(
                  Icons.circle,
                  color: Color(0XFF05D8E8),
                  size: 15.0,
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}

class AllStationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: size.height * 0.06,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Hello ',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: 'Miau',
                        style: TextStyle(
                          color: Color(0XFFFF296D),
                        ),
                      ),
                    ],
                  ),
                ),
                AvatarWidget(
                  side: 150,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'All Stations',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Align(
            child: CardStation(),
          )
        ],
      ),
    );
  }
}

class CardStation extends StatelessWidget {
  const CardStation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          15,
        ),
        color: Color(0XFFFF296D),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, top: 10, right: 15.0, bottom: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Playing',
                  style: TextStyle(
                    color: Color(0XFFAA1E4A),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  '90.5',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Divelement',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Align(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomPaint(
                      foregroundPainter: EqualizePainter(),
                      child: Container(
                        height: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EqualizePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final initialPoint = Offset(0, size.height * 0.33);
    final endPoint = Offset(size.width, size.height * 0.33);

    Paint paintLine = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = Colors.white
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
    paintCircle.color = Color(0XFFB02854);

    canvas.drawPath(path, paintLine);

    canvas.drawCircle(initialPoint, 5, paintCircle);
    canvas.drawCircle(endPoint, 5, paintCircle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class AvatarWidget extends StatelessWidget {
  final double side;

  const AvatarWidget({@required this.side});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: side,
      // width: (math.sqrt(3) / 2) * side,
      child: ClipPath(
        clipper: AvatarClipper(),
        child: Image.asset(
          'assets/images/radio_app/profile_picture.png',
          width: 100,
        ),
      ),
    );
  }
}

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
    // path.arcToPoint(p2, radius: Radius.circular(radius));
    path.quadraticBezierTo(size.width, size.height / 2, p2.dx, p2.dy);

    path.lineTo(size.width * 0.25, size.height * 0.85);

    path.quadraticBezierTo(0, size.height, 0, size.height * 0.75);

    path.close();

    canvas.drawImage(image, Offset(0, 0), paint);

    canvas.drawPath(path, paint);

    /*Paint paint2 = Paint();
    paint2.style = PaintingStyle.stroke;
    paint2.color = Colors.yellow;

    Path path2 = Path();
    path2.moveTo(size.width - (math.sqrt(3) - radius), size.height);

    canvas.drawCircle(
        Offset(size.width - 2 * radius - 6, size.height / 2), radius, paint2);*/
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
