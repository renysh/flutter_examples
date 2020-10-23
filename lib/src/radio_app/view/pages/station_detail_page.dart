import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_examples/src/radio_app/bloc/station_provider.dart';
import 'package:flutter_examples/src/radio_app/view/widgets/avatar_widget.dart';
import 'package:flutter_examples/src/radio_app/view/widgets/controls_section.dart';
import 'package:provider/provider.dart';

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
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Container(
                    width: size.width,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Playing now',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 35.0,
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.favorite,
                              color: Color(0XFFFF296D),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/radio_app/frame_equalizer.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        Provider.of<StationProvider>(context)
                            .selectedStation
                            .frecuence,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        Provider.of<StationProvider>(context)
                            .selectedStation
                            .name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: double.infinity,
                        padding:
                            const EdgeInsets.only(right: 30.0, bottom: 30.0),
                        child: Row(
                          children: [
                            Spacer(),
                            Container(
                              width: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Top 20',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Best Music',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white.withOpacity(0.4),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: ControlsSection(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
