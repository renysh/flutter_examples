import 'package:flutter/material.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0XFF0A0A14),
      body: Stack(
        children: [
          Positioned(
            bottom: -10,
            child: Image.asset('assets/images/space_concept/tierra_1.png'),
          ),
          Positioned(
            top: size.height * 0.07,
            child: Image.asset('assets/images/space_concept/sombra.png'),
          ),
          Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'assets/images/space_concept/cross.png',
                          width: 20.0,
                          height: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Space',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontFamily: 'Mark',
                  ),
                ),
                Text(
                  'Exploration',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontFamily: 'Mark',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 30.0,
                    right: size.width * 0.25,
                  ),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Habitant sem ut sit fames in adipiscing. Ac magna donec egestas habitant.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontFamily: 'Mark',
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  'View More',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Mark',
                  ),
                ),
                Spacer(),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Space',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Mark',
                      ),
                      children: [
                        TextSpan(
                          text: 'Element',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Mark',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
