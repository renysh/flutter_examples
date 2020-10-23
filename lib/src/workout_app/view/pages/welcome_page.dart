import 'package:flutter/material.dart';
import 'package:flutter_examples/src/workout_app/theme.dart';
import 'package:flutter_examples/src/workout_app/view/pages/login_page.dart';
import 'package:flutter_examples/src/workout_app/view/widgets/title_widget.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/workout_app/hipcravo-DC5akQJyH4I-unsplash.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/workout_app/layer.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 35,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  TitleWidget(),
                  SizedBox(
                    height: size.height * 0.25,
                  ),
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'EuclidCircularA',
                      color: AppColors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: size.width * 0.2),
                    child: Text(
                      'train and live the new experience of exercising at home',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'EuclidCircularA',
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.20,
                  ),
                  RaisedButton(
                    color: AppColors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'Try Now',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                          fontFamily: 'Aeonik',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                          color: AppColors.white,
                          width: 2,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                          fontFamily: 'Aeonik',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => LoginPage()));
                    },
                  ),
                  Spacer(),
                  Text(
                    'Change language',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Aeonik',
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: AppColors.green,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
