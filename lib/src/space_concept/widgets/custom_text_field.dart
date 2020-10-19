import 'package:flutter/material.dart';
import 'package:flutter_examples/src/space_concept/painters/text_field_painter.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final Color borderColor;

  const CustomTextField(
      {@required this.label,
      @required this.hintText,
      @required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomPaint(
            painter: TextFieldPainter(this.borderColor),
            child: Container(
              height: 60.0,
              // width: 200,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  top: 10.0,
                  right: 20.0,
                  bottom: 10,
                ),
                child: TextFormField(
                  cursorColor: Color(0XFFFF296D),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
