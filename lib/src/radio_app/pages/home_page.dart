import 'package:flutter/material.dart';
import 'dart:math' as math;

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
        children: [
          SizedBox(
            height: size.height * 0.06,
          ),
          Row(
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
            ],
          ),
          AvatarWidget(
            side: 350,
          ),
        ],
      ),
    );
  }
}

class AvatarWidget extends StatelessWidget {
  final double side;

  const AvatarWidget({@required this.side});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: AvatarPainter(),
      child: Container(
        height: side,
        width: (math.sqrt(3) * side / 2),
        // child: Image.asset('assets/images/radio_app/profile_picture.png'),
      ),
    );
  }
}

class AvatarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double radius = 30;
    print(size);
    Paint paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.color = Colors.pink;

    Path path = Path();
    path.moveTo(0, 0);
    Offset p1 = Offset(size.width - 2 * radius, size.height / 2 - radius);
    Offset p2 = Offset(size.width - 2 * radius, size.height / 2 + radius);
    path.lineTo(p1.dx, p1.dy);
    // path.arcToPoint(p2, radius: Radius.circular(radius));
    path.quadraticBezierTo(size.width, size.height/2, p2.dx, p2.dy);

    path.lineTo(0, size.height);

    path.close();

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
