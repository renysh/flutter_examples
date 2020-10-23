import 'package:flutter/material.dart';
import 'package:flutter_examples/src/workout_app/bloc/workout_provider.dart';
import 'package:flutter_examples/src/workout_app/models/training-state.model.dart';
import 'package:flutter_examples/src/workout_app/theme.dart';
import 'package:flutter_examples/src/workout_app/view/pages/home_training_page.dart';
import 'package:flutter_examples/src/workout_app/view/widgets/about_status_card.dart';
import 'package:flutter_examples/src/workout_app/view/widgets/title_widget.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/workout_app/sule-makaroglu-YFmvjO3TP_s-unsplash.png',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/workout_app/layer.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TitleWidget(),
                    SizedBox(
                      height: size.height * 0.15,
                    ),
                    Text(
                      'About You',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                        fontFamily: 'Aeonik',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: size.width * 0.2),
                      child: Text(
                        'we want to know more about you, follow the next steps to complete the information',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                          fontFamily: 'EuclidCircularA',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          Provider.of<WorkoutProvider>(context).states.length,
                      itemBuilder: (context, index) {
                        List<TrainingState> _states =
                            Provider.of<WorkoutProvider>(context).states;

                        return Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              Provider.of<WorkoutProvider>(context,
                                      listen: false)
                                  .selectState(_states[index]);
                            },
                            child: AboutStatusCard(
                              state: _states[index],
                            ),
                          ),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                height: size.height * 0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                HomeTrainingPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Skip Intro',
                        style: TextStyle(
                          fontFamily: 'Aeonik',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white.withOpacity(0.42),
                        ),
                      ),
                    ),
                    RaisedButton(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10.0),
                        child: Text(
                          'Next',
                          style: TextStyle(
                            fontFamily: 'Aeonik',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      color: AppColors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
