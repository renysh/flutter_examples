import 'package:flutter/material.dart';
import 'package:flutter_examples/src/workout_app/theme.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'HARD ',
        style: TextStyle(
          fontSize: 32,
          fontFamily: 'BebasNeue',
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(
            text: 'ELEMENT',
            style: TextStyle(
              color: AppColors.green,
            ),
          ),
        ],
      ),
    );
  }
}
