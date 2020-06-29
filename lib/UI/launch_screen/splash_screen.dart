import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterhackathon/UI/main_screen/main_scree.dart';
import 'package:flutterhackathon/constants.dart';
import 'package:flutterhackathon/UTIL/size_util.dart';
import 'package:flutterhackathon/widgets/customs/custom_rect.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context,
            PageTransition(
                curve: Curves.bounceOut,
                type: PageTransitionType.fade,
                child: MainScreen(),
                duration: Duration(seconds: 1))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: CustomPaint(
              painter: MyPainter(false),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    SizedBox(height: 70),
                    Container(
                      padding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: Text(
                        'Project X',
                        style: TextStyle(
                          color: Colors.green.shade400,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Cyberpunk",
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
