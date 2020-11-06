import 'package:flutter/material.dart';
import 'package:flutter_examples/src/animation_wave/wave_page.dart';

class AnimationWave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wave Animation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'SF Pro Display',
              bodyColor: Colors.white,
            ),
      ),
      home: WavePage(),
    );
  }
}
