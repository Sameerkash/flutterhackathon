import 'package:flutter/material.dart';
import 'package:flutterhackathon/UI/ar_scan/scanner_screen.dart';
import 'package:flutterhackathon/widgets/customs/custom_rect.dart';
import 'package:flutterhackathon/widgets/primary_button.dart';

import 'face_detection.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Image.asset('assets/images/login-person-face.jpg'),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              child: CustomPaint(
                  painter: MyPainter(false),
                  child: Container(
                      height: 400,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Center(
                              child: Container(
                                height: 50,
                                width: 130,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: Color.fromRGBO(197, 1, 80, 1)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(28, 28, 137, 1)
                                            .withOpacity(0.7),
                                        spreadRadius: 5,
                                        blurRadius: 5,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    color: Colors.black),
                                child: Center(
                                  child: Text(
                                    "LOGIN",
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.green[300]),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: PrimaryButton(
                                width: 180,
                                height: 50,
                                color: Colors.green,
                                buttonText: "START",
                                onPressed: () => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => LoginFaceDetection()),
                                        (Route<dynamic> route) => false),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Click to Start and face scanning validation",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15, color: Colors.purpleAccent),
                            ),
                          ),
                        ],
                      ))),
            ),
          ),
        ],
      ),
    );
  }
}
