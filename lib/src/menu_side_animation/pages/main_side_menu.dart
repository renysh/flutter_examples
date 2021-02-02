import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MainSideMenu extends StatelessWidget {
  final _data = List<String>.generate(8, (index) {
    if (index == 0) {
      return 'assets/side_menu/icn_close.png';
    }
    return 'assets/side_menu/icn_$index.png';
  });

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      onItemSelected: (index) {},
      builder: (showMenu) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: showMenu,
            ),
          ),
          body: Image.asset(
            'assets/side_menu/content_films.png',
            fit: BoxFit.fill,
            width: double.infinity,
          ),
        );
      },
      items: _data
          .map((e) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(e),
              ))
          .toList(),
    );
  }
}

typedef SideMenuBuilder = Widget Function(VoidCallback showMenu);

class SideMenu extends StatefulWidget {
  final SideMenuBuilder builder;
  final List<Widget> items;
  final ValueChanged<int> onItemSelected;
  final Color selectedColor;
  final Color unselectedColor;

  const SideMenu({
    Key key,
    this.builder,
    this.items,
    this.onItemSelected,
    this.selectedColor = Colors.black,
    this.unselectedColor = Colors.green,
  }) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  List<Animation<double>> _animations;

  int _selectedIndex = 0;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1200,
      ),
    );
    final _intervalGap = 1 / widget.items.length;
    _animations = List.generate(
      widget.items.length,
      (index) => Tween(begin: 0.0, end: 1.6).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(
            index * _intervalGap,
            index * _intervalGap + _intervalGap,
          ),
        ),
      ),
    ).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final itemSize = constraints.maxHeight / widget.items.length;
          final width = 100.0;
          timeDilation = 1.0;
          return AnimatedBuilder(
            animation: _animationController,
            builder: (BuildContext context, Widget child) {
              return Stack(
                children: [
                  this.widget.builder(() {
                    _animationController.reverse();
                  }),
                  for (int i = 0; i < widget.items.length; i++)
                    Positioned(
                      left: 0,
                      top: itemSize * i,
                      width: width,
                      height: itemSize,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(
                            _animationController.status ==
                                    AnimationStatus.reverse
                                ? -_animations[widget.items.length - 1 - i]
                                    .value
                                : -_animations[i].value,
                          ),
                        alignment: Alignment.topLeft,
                        child: Material(
                          color: Colors.blue,
                          child: InkWell(
                            onTap: () {
                              _animationController.forward(from: 0.0);
                              if (i != 0) {
                                setState(() {
                                  this._selectedIndex = i;
                                });
                              }
                            },
                            child: widget.items[i],
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    this._animationController.dispose();
    super.dispose();
  }
}
