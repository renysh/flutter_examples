import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';

import 'package:flutter_examples/src/space_concept/painters/painter_login.dart';
import 'package:flutter_examples/src/space_concept/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          ConstrainedBox(
            child: Image.asset(
              "assets/images/radio_app/welcome_background.png",
              fit: BoxFit.fill,
            ),
            constraints: BoxConstraints.expand(),
          ),
          Container(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 6),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0XFF01012A).withOpacity(0.80),
                ),
              ),
            ),
          ),
          CustomPaint(
            painter: PainterLogin(),
            child: Container(
              width: size.width,
              height: size.height,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: size.height * 0.23,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 60.0,
                      child:
                          Image.asset('assets/images/radio_app/icon_login.png'),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                  Text(
                    'to start play',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  CustomTextField(
                    label: 'Phone Number',
                    hintText: 'Your phone number',
                    borderColor: Color(0XFFFF296D),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      color: Color(0XFF05D8E8),
                      height: 65,
                      width: size.width * 0.4,
                      child: Center(
                        child: Image.asset(
                            'assets/images/radio_app/arrow_right.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    'Or Sign In',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
