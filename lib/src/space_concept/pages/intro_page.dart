import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Space',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontFamily: 'Mark',
                  fontWeight: FontWeight.w900,
                ),
                children: [
                  TextSpan(
                    text: 'Element',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Mark',
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
                'assets/images/space_concept/pixeltrue-space-discovery1.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Explore',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Mark',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'Universe',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Mark',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Image.asset('assets/images/space_concept/arrow_right.png'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 30, right: (size.width * 0.40), top: 20.0),
              child: Container(
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Habitant sem ut sit fames in adipiscing. Ac magna donec egestas habitant.',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Mark',
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Skip step',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Mark',
                      color: Color(0XFFBBBBBB),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontFamily: 'Mark',
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}
