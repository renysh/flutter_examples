import 'package:flutter/material.dart';
import 'package:flutter_examples/src/workout_app/bloc/workout_provider.dart';
import 'package:flutter_examples/src/workout_app/theme.dart';
import 'package:provider/provider.dart';

class DetailsTrainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/workout_app/edgar-chaparro-sHfo3WOgGTU-unsplash_(1).png',
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
            children: [
              Container(
                height: 100,
                padding: EdgeInsets.only(left: 30, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      // height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: AppColors.green,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 20,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.timer,
                              color: AppColors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '3 Hours',
                              style: TextStyle(
                                color: AppColors.white,
                                fontFamily: 'Aeonik',
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.white,
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height * 0.35,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    height: 50,
                    width: size.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '16 ',
                            style: TextStyle(
                              color: AppColors.green,
                              fontFamily: 'Aeonik',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                text: 'moves',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontFamily: 'Aeonik',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: '12 ',
                            style: TextStyle(
                              color: AppColors.green,
                              fontFamily: 'Aeonik',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                text: 'Sets',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontFamily: 'Aeonik',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: '30 ',
                            style: TextStyle(
                              color: AppColors.green,
                              fontFamily: 'Aeonik',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                text: 'min',
                                style: TextStyle(
                                  color: AppColors.white,
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
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Advance Workout',
                        style: TextStyle(
                          color: AppColors.white,
                          fontFamily: 'Aeonik',
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0XFFf7be1e),
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0XFFf7be1e),
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0XFFf7be1e),
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0XFF24253c),
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0XFF24253c),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Provider.of<WorkoutProvider>(context,
                                      listen: false)
                                  .selectSectionDetails(0);
                            },
                            child: Text(
                              'Description',
                              style: TextStyle(
                                color: Provider.of<WorkoutProvider>(context)
                                            .detailSectionSelectionIndex ==
                                        0
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.15),
                                fontFamily: 'Aeonik',
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Provider.of<WorkoutProvider>(context,
                                      listen: false)
                                  .selectSectionDetails(1);
                            },
                            child: Text(
                              'Feedback',
                              style: TextStyle(
                                color: Provider.of<WorkoutProvider>(context)
                                            .detailSectionSelectionIndex ==
                                        1
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.15),
                                fontFamily: 'Aeonik',
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Provider.of<WorkoutProvider>(context,
                                      listen: false)
                                  .selectSectionDetails(2);
                            },
                            child: Text(
                              'related',
                              style: TextStyle(
                                color: Provider.of<WorkoutProvider>(context)
                                            .detailSectionSelectionIndex ==
                                        2
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.15),
                                fontFamily: 'Aeonik',
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      IndexedStack(
                        index: Provider.of<WorkoutProvider>(context)
                            .detailSectionSelectionIndex,
                        children: [
                          Container(
                            child: Text(
                              'Description Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata',
                              style: TextStyle(
                                color: AppColors.white.withOpacity(0.5),
                                fontFamily: 'Aeonik',
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              'Feedback Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata',
                              style: TextStyle(
                                color: AppColors.white.withOpacity(0.5),
                                fontFamily: 'Aeonik',
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              'related Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata',
                              style: TextStyle(
                                color: AppColors.white.withOpacity(0.5),
                                fontFamily: 'Aeonik',
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      RaisedButton(
                        color: AppColors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            "Begin Train for ̣\$5.00",
                            style: TextStyle(
                              color: AppColors.white,
                              fontFamily: 'Aeonik',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      OutlineButton(
                        borderSide: BorderSide(
                          color: AppColors.green,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            'Begin Train Demo',
                            style: TextStyle(
                              color: AppColors.white,
                              fontFamily: 'Aeonik',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
