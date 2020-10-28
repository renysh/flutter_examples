import 'package:flutter/material.dart';
import 'package:flutter_examples/src/vinyl/vinyl_page.dart';

class VinylApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorkOut App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: VinylPage(),
    );
  }
}
