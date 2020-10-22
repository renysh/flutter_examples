import 'package:flutter/material.dart';

class LabelDestination extends StatelessWidget {
  final bool selected;
  final String text;

  const LabelDestination({@required this.selected, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RotatedBox(
          child: Text(text),
          quarterTurns: -1,
        ),
        this.selected
            ? Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(
                  Icons.circle,
                  color: Color(0XFF05D8E8),
                  size: 15.0,
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
