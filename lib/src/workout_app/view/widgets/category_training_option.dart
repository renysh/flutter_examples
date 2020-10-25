import 'package:flutter/material.dart';
import 'package:flutter_examples/src/workout_app/bloc/workout_provider.dart';
import 'package:flutter_examples/src/workout_app/theme.dart';
import 'package:provider/provider.dart';

class CategoryTrainingOption extends StatelessWidget {
  final String label;
  final int id;

  const CategoryTrainingOption({this.label, @required this.id});

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutProvider>(
      builder: (context, bloc, _) {
        return GestureDetector(
          onTap: () {
            bloc.selectCategoryOption(id);
          },
          child: Container(
            decoration: BoxDecoration(
              border: bloc.categorySeletedId == id
                  ? Border.all(
                      color: AppColors.green,
                    )
                  : null,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                label,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                  fontFamily: 'Aeonik',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
