import 'package:flutter/material.dart';
import 'package:flutter_examples/src/menu_side_animation/pages/main_side_menu.dart';

class MenuSideAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Side Animarion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Poppins',
              bodyColor: Colors.white,
            ),
      ),
      home: MainSideMenu(),
    );
  }
}
