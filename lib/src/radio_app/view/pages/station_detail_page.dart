import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_examples/src/radio_app/view/widgets/avatar_widget.dart';

class StationDetailPage extends StatelessWidget {
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
          Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 35.0,
                      ),
                      onPressed: () {
                        print('object');
                        Navigator.of(context).pop();
                      },
                    ),
                    AvatarWidget(
                      side: 60,
                    ),
                  ],
                ),
              ),
              Text(
                'Playing now',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ],
      ),
    );
  }
}
