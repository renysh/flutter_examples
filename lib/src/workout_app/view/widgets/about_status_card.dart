import 'package:flutter/material.dart';
import 'package:flutter_examples/src/workout_app/bloc/workout_provider.dart';
import 'package:flutter_examples/src/workout_app/models/training-state.model.dart';
import 'package:flutter_examples/src/workout_app/theme.dart';
import 'package:provider/provider.dart';

class AboutStatusCard extends StatelessWidget {
  final TrainingState state;

  const AboutStatusCard({this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Provider.of<WorkoutProvider>(context).selectedState.id == state.id
              ? Align(
                  alignment: Alignment.centerRight,
                  child: CircleAvatar(
                    backgroundColor: Color(0XFF373850),
                    radius: 20.0,
                    child: Icon(
                      Icons.check,
                      color: AppColors.green,
                    ),
                  ),
                )
              : SizedBox(
                  height: 40,
                ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'I am ',
            style: TextStyle(
              fontFamily: 'Aeonik',
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: AppColors.green,
            ),
          ),
          Text(
            state.status,
            style: TextStyle(
              fontFamily: 'Aeonik',
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: AppColors.green,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            state.description,
            style: TextStyle(
              fontFamily: 'Aeonik',
              color: AppColors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
