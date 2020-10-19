import 'package:flutter/material.dart';
import 'package:flutter_examples/src/widgets_examples/pages/widgets_page.dart';

class WidgetsExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space Concept',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WidgetsPage(),
    );
  }
}
