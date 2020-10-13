import 'package:flutter/material.dart';
import 'package:flutter_examples/src/space_concept/pages/intro_page.dart';

class SpaceConcept extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IntroPage(),
    );
  }
}
