import 'dart:ui';

import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    //'assets/images/radio_app/welcome_background.png',
                    'assets/images/radio_app/happy-dj-woman-mixing-for-the-crowd.png',
                  ),
                  fit: BoxFit.fill),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/radio_app/welcome_background.png',
                    ),
                    fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Image.asset('assets/images/radio_app/welcome_title.png'),
                    Text(
                      'Let’s Get Started',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: size.width * 0.35),
                      child: Text(
                        "Enjoy the best radio stations from your home, don't miss out on anything",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 50.0,
                      child: RaisedButton(
                        color: Color(0XFFFF296D),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {},
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.07,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
