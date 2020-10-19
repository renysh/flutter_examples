import 'package:flutter/material.dart';
import 'package:flutter_examples/src/radio_app/pages/home_page.dart';

class RadioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radio App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'SF Pro Display',
              bodyColor: Colors.white,
            ),
      ),
      home: HomePage(),
    );
  }
}
