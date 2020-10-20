import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

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
      height: 139,
      width: 139,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          15,
        ),
        color: Color(0XFFFF296D),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
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
                  height: 5.0,
                ),
                Align(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomPaint(
                      painter: EqualizePainter(),
                      child: Container(
                        // color: Colors.blue,
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
    final initialPoint = Offset(0, size.height * 0.2);
    final endPoint = Offset(size.width, size.height * 0.2);

    Paint paintLine = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..color = Colors.white
      ..strokeJoin = StrokeJoin.round;

    Path path = Path();
    path.moveTo(initialPoint.dx, initialPoint.dy);
    path.relativeCubicTo(size.width * 0.0625, size.height + 10,
        size.width * 0.1875, -20, size.width * 0.25, size.height * 0.5);
    path.close();
    

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
