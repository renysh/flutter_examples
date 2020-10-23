import 'package:flutter/material.dart';
import 'package:flutter_examples/src/workout_app/bloc/workout_provider.dart';
import 'package:flutter_examples/src/workout_app/theme.dart';
import 'package:flutter_examples/src/workout_app/view/pages/about_page.dart';
import 'package:flutter_examples/src/workout_app/view/widgets/title_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/workout_app/alexander-jawfox-Kl2t5U6Gkm0-unsplash.png',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/workout_app/rectangulo_45.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: size.height * 0.15,
                  ),
                  TitleWidget(),
                  SizedBox(
                    height: size.height * 0.15,
                  ),
                  Text(
                    'sign in',
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
                      'train and live the new experience of exercising at home',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                        fontFamily: 'EuclidCircularA',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.07,
                  ),
                  TextFormField(
                    cursorColor: AppColors.white,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: AppColors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.white,
                          width: 1.0,
                        ),
                      ),
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.white,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    cursorColor: AppColors.white,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: AppColors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.white,
                          width: 1.0,
                        ),
                      ),
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.white,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Forgot your password?',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                  // Spacer(),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  RaisedButton(
                    color: AppColors.green,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    onPressed: () async {
                      await Provider.of<WorkoutProvider>(context, listen: false)
                          .loadStates();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => AboutPage()));
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  FlatButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: BorderSide(
                        color: AppColors.green,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
