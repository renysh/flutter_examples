import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/space_concept/background_home.png'),
            fit: BoxFit.fill,
            scale: 1.0
          ),
        ),
        child: null /* add child content here */,
      ),
    );
  }
}
