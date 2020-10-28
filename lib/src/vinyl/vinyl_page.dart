import 'dart:math';

import 'package:flutter/material.dart';

class VinylPage extends StatefulWidget {
  @override
  _VinylPageState createState() => _VinylPageState();
}

class _VinylPageState extends State<VinylPage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Center(
                child: AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: animationController.value * 6.3,
                      child: GestureDetector(
                        onTapUp: (details) {
                          print('tapUp');
                          print(animationController.status);
                          animationController.repeat();
                          print(animationController.status);
                        },
                        onTapDown: (details) {
                          print('tapDown');
                          print(animationController.status);
                          animationController.stop();
                          print(animationController.status);
                        },
                        onPanStart: (details) {
                          print('onPanStart');
                          print(details);
                        },
                        onPanEnd: (details) {
                          print('onPanEnd');
                          print(details);
                        },
                        child: Image.asset(
                          'assets/images/vinyl_PNG67.png',
                          height: 350,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    animationController.reset();
                    animationController.repeat();
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.play_arrow,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
