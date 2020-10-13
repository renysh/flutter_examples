import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          RichText(
            text: TextSpan(
              text: 'Space',
              children: [
                TextSpan(text: 'Element'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
