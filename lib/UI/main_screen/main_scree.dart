import 'package:flutter/material.dart';
import 'package:flutterhackathon/UI/jobs/jobs.dart';
import 'package:flutterhackathon/UI/profile/profile_section.dart';
import 'package:flutterhackathon/widgets/customs/custom_rect.dart';
import 'package:flutterhackathon/widgets/primary_screen.dart';
import 'package:page_transition/page_transition.dart';

class MainScreen extends StatelessWidget {
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
              painter: MyPainter(),
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
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
                                "MENU",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.green[300]),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      GridView.count(
                          shrinkWrap: true,
                          mainAxisSpacing: 3,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: PrimaryButton(
                                  height: 80,
                                  width: 180,
                                  icon: Icons.work,
                                  color: Colors.green,
                                  buttonText: "JOBS",
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                            transitionDuration:
                                                Duration(milliseconds: 500),
                                            transitionsBuilder: (BuildContext
                                                    context,
                                                Animation<double> animation,
                                                Animation<double> secAnimation,
                                                Widget child) {
                                              animation = CurvedAnimation(
                                                  parent: animation,
                                                  curve: Curves.easeOutCubic);

                                              return ScaleTransition(
                                                scale: animation,
                                                child: child,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            pageBuilder: (BuildContext context,
                                                Animation<double> animation,
                                                Animation<double>
                                                    secAnimation) {
                                              return JobsPage();
                                            }));
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: PrimaryButton(
                                  height: 80,
                                  width: 180,
                                  icon: Icons.add_shopping_cart,
                                  color: Colors.green,
                                  buttonText: "SHOP",
                                  onPressed: () {}),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: PrimaryButton(
                                  height: 80,
                                  width: 180,
                                  icon: Icons.person_add,
                                  color: Colors.green,
                                  buttonText: "HIRE",
                                  onPressed: () {}),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: PrimaryButton(
                                  height: 80,
                                  width: 180,
                                  icon: Icons.business,
                                  color: Colors.green,
                                  buttonText: "MED",
                                  onPressed: () {}),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: PrimaryButton(
                                  height: 80,
                                  width: 180,
                                  icon: Icons.scanner,
                                  color: Colors.green,
                                  buttonText: "SCAN",
                                  onPressed: () {}),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: PrimaryButton(
                                  height: 80,
                                  width: 180,
                                  icon: Icons.account_circle,
                                  color: Colors.green,
                                  buttonText: "PROFILE",
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                            transitionDuration:
                                                Duration(milliseconds: 500),
                                            transitionsBuilder: (BuildContext
                                                    context,
                                                Animation<double> animation,
                                                Animation<double> secAnimation,
                                                Widget child) {
                                              animation = CurvedAnimation(
                                                  parent: animation,
                                                  curve: Curves.easeOutCubic);

                                              return ScaleTransition(
                                                scale: animation,
                                                child: child,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            pageBuilder: (BuildContext context,
                                                Animation<double> animation,
                                                Animation<double>
                                                    secAnimation) {
                                              return ProfileSection();
                                            }));
                                  }),
                            ),
                          ],
                          crossAxisCount: 2)
                    ],
                  ))),
        ),
      ),
    );
  }
}
