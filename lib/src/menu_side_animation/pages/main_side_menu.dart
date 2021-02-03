import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MainSideMenu extends StatefulWidget {
  @override
  _MainSideMenuState createState() => _MainSideMenuState();
}

class _MainSideMenuState extends State<MainSideMenu> {
  final _data = List<String>.generate(8, (index) {
    if (index == 0) {
      return 'assets/side_menu/icn_close.png';
    }
    return 'assets/side_menu/icn_$index.png';
  });

  int _selectedIndex = 1;

  String _getText() {
    if (_selectedIndex.isOdd) {
      return 'Films';
    } else {
      return 'Music';
    }
  }

  Widget _getWidget() {
    String value;
    if (_selectedIndex.isOdd) {
      value = 'assets/side_menu/content_films.png';
    } else {
      value = 'assets/side_menu/content_music.png';
    }

    return DecoratedBox(
      child: Container(),
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(value),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      onItemSelected: (index) {
        if (index != 0) {
          setState(() {
            _selectedIndex = index;
          });
        }
      },
      selectedColor: Color(0XFFCE5C7F),
      unselectedColor: Color(0XFF3a3b55),
      menuWidth: 90.0,
      builder: (showMenu) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: showMenu,
            ),
            title: Text(
              _getText(),
            ),
          ),
          body: _getWidget(),
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
  final double menuWidth;
  final Duration duration;

  const SideMenu({
    Key key,
    this.builder,
    this.items,
    this.onItemSelected,
    this.selectedColor = Colors.black,
    this.unselectedColor = Colors.green,
    this.menuWidth = 100.0,
    this.duration = const Duration(milliseconds: 1200),
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
      duration: widget.duration,
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
    _animationController.forward(from: 1.0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final itemSize = constraints.maxHeight / widget.items.length;
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
                      width: this.widget.menuWidth,
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
                          color: i == _selectedIndex
                              ? widget.selectedColor
                              : widget.unselectedColor,
                          child: InkWell(
                            onTap: () {
                              _animationController.forward(from: 0.0);
                              if (i != 0) {
                                setState(() {
                                  this._selectedIndex = i;
                                });
                              }
                              widget.onItemSelected(i);
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
