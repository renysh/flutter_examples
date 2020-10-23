import 'package:flutter/material.dart';
import 'package:flutter_examples/src/workout_app/theme.dart';

class HomeTrainingPage extends StatefulWidget {
  @override
  _HomeTrainingPageState createState() => _HomeTrainingPageState();
}

class _HomeTrainingPageState extends State<HomeTrainingPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/workout_app/charles-gaudreault-xXofYCc3hqc-unsplash.png',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/workout_app/rectangulo_35.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                height: size.height * 0.5,
                child: Column(
                  children: [
                    SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'Hey, ',
                              style: TextStyle(
                                color: AppColors.green,
                                fontFamily: 'Aeonik',
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Miau',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontFamily: 'Aeonik',
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ]),
                        ),
                        Image.asset(
                            'assets/images/workout_app/circleAvatar.png'),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: size.height * 0.4,
                child: Placeholder(),
              ),
              Container(
                height: size.height * 0.1,
                child: Placeholder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
