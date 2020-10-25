import 'package:flutter/material.dart';
import 'package:flutter_examples/src/workout_app/theme.dart';
import 'package:flutter_examples/src/workout_app/view/widgets/category_training_option.dart';

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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  height: size.height * 0.5,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 20,
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
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
                                  ],
                                ),
                              ),
                              Image.asset(
                                  'assets/images/workout_app/circleAvatar.png'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 50,
                        child: Container(
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.green.withOpacity(0.12),
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(10.0),
                              child: CircleAvatar(
                                backgroundColor: AppColors.green,
                                radius: 35,
                                child: Icon(
                                  Icons.play_arrow,
                                  color: AppColors.white,
                                  size: 50,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 15,
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Find ',
                                  style: TextStyle(
                                    color: AppColors.green,
                                    fontFamily: 'Aeonik',
                                    fontSize: 26,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'your Workout',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontFamily: 'Aeonik',
                                        fontSize: 26,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.filter_alt_outlined,
                                color: AppColors.white,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 15,
                        child: Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(23),
                              ),
                              fillColor: Color(0XFF232441),
                              filled: true,
                              hintText: 'SEARCH WORKOUT',
                              hintStyle: TextStyle(
                                color: AppColors.white,
                                fontSize: 10,
                                fontFamily: 'Aeonik',
                                fontWeight: FontWeight.w400,
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Icon(
                                  Icons.search,
                                  color: AppColors.white,
                                  size: 30,
                                ),
                              ),
                              contentPadding: EdgeInsets.only(left: 40.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: size.height * 0.42,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CategoryTrainingOption(
                            id: 0,
                            label: 'Popular',
                          ),
                          CategoryTrainingOption(
                            id: 1,
                            label: 'Hard workout',
                          ),
                          CategoryTrainingOption(
                            id: 2,
                            label: 'Full body',
                          ),
                          CategoryTrainingOption(
                            id: 3,
                            label: 'Crossfit',
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 30.0, top: 15.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'Popular Workout',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontFamily: 'Aeonik',
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: size.height * 0.08,
                  color: Color(0XFF242538),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/workout_app/4-points.png'),
                      Text(
                        'Workout',
                        style: TextStyle(
                          color: AppColors.white.withOpacity(0.41),
                          fontFamily: 'Aeonik',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Level',
                        style: TextStyle(
                          color: AppColors.white.withOpacity(0.41),
                          fontFamily: 'Aeonik',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                          color: AppColors.white.withOpacity(0.41),
                          fontFamily: 'Aeonik',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
