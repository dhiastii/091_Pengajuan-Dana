import 'package:flutter/material.dart';
import 'package:pengajuan_dana/view/login.dart';
import 'package:pengajuan_dana/view/register.dart';

class SplashScreenn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color.fromRGBO(59, 133, 199, 1),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 100,
              left: 26,
              child: Text(
                'Pengajuan Dana Proposal KMTI',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Arsenal',
                  fontSize: 24,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            Positioned(
              top: 270,
              left: 30,
              child: Container(
                width: 200,
                height: 100,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              top: 240,
              left: 230,
              child: Container(
                width: 150,
                height: 150,
                child: Image.asset(
                  'assets/images/logoti.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              left: (MediaQuery.of(context).size.width - 200) / 2,
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromRGBO(217, 217, 217, 1),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Arsenal',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
