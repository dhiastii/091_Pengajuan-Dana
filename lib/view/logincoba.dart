import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator LoginWidget - FRAME
    return Container(
        width: 360,
        height: 640,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 4),
                blurRadius: 4)
          ],
          color: Color.fromRGBO(255, 255, 255, 1),
          border: Border.all(
            color: Color.fromRGBO(0, 0, 0, 1),
            width: 1,
          ),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              top: 293,
              left: 83,
              child: Container(
                  width: 193,
                  height: 41,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45),
                      bottomLeft: Radius.circular(45),
                      bottomRight: Radius.circular(45),
                    ),
                    color: Color.fromRGBO(0, 93, 178, 1),
                  ))),
          Positioned(
              top: 0,
              left: 118,
              child: Container(
                  width: 124,
                  height: 47,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 10,
                        left: 0,
                        child: Container(
                            width: 75,
                            height: 28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(54),
                                topRight: Radius.circular(54),
                                bottomLeft: Radius.circular(54),
                                bottomRight: Radius.circular(54),
                              ),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/Logo1.png'),
                                  fit: BoxFit.fitWidth),
                            ))),
                    Positioned(
                        top: 0,
                        left: 72,
                        child: Container(
                            width: 52,
                            height: 47,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(212),
                                topRight: Radius.circular(212),
                                bottomLeft: Radius.circular(212),
                                bottomRight: Radius.circular(212),
                              ),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Logotiremovebgpreview1.png'),
                                  fit: BoxFit.fitWidth),
                            ))),
                  ]))),
          Positioned(
              top: 72,
              left: 154,
              child: Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Arsenal',
                    fontSize: 24,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 296,
              left: 148,
              child: Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Arsenal',
                    fontSize: 24,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 142,
              left: 16,
              child: Container(
                  width: 328,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45),
                      bottomLeft: Radius.circular(45),
                      bottomRight: Radius.circular(45),
                    ),
                    color: Color.fromRGBO(217, 217, 217, 1),
                  ))),
          Positioned(
              top: 212,
              left: 16,
              child: Container(
                  width: 328,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45),
                      bottomLeft: Radius.circular(45),
                      bottomRight: Radius.circular(45),
                    ),
                    color: Color.fromRGBO(217, 217, 217, 1),
                  ))),
          Positioned(
              top: 152,
              left: 9,
              child: Text(
                'Email Address',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(119, 111, 111, 1),
                    fontFamily: 'Arsenal',
                    fontSize: 19,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 221,
              left: 26,
              child: Text(
                'Password',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(119, 111, 111, 1),
                    fontFamily: 'Arsenal',
                    fontSize: 19,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 221,
              left: 295,
              child: Container(
                  width: 29,
                  height: 29,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(241),
                      topRight: Radius.circular(241),
                      bottomLeft: Radius.circular(241),
                      bottomRight: Radius.circular(241),
                    ),
                    image: DecorationImage(
                        image: AssetImage('assets/images/Hide1.png'),
                        fit: BoxFit.fitWidth),
                  ))),
          Positioned(
              top: 368,
              left: 53,
              child: Text(
                'Dont have an account? Register',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Arsenal',
                    fontSize: 13,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
        ]));
  }
}
