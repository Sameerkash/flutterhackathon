import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:flutterhackathon/RESOURCES/COMPONENTS/app_bar.dart';
import 'package:flutterhackathon/RESOURCES/COMPONENTS/flat_button.dart';
import 'package:flutterhackathon/RESOURCES/VALUES/app_color.dart';

class JobsPage extends StatefulWidget {
  @override
  _JobsPageState createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> with TickerProviderStateMixin {
  Random rnd = new Random();
  List<String> personImages = [
    "assets/images/person1.jpg",
    "assets/images/person2.jpg",
    "assets/images/person3.jpg",
    "assets/images/person1.jpg",
    "assets/images/person2.jpg",
    "assets/images/person3.jpg",
  ];

  _addPeople() {
    int count = rnd.nextInt(100) + 45;
    for (int i = 0; i < count; i++)
      personImages.add('assets/images/person${rnd.nextInt(3) + 1}.jpg');
  }

  @override
  void initState() {
    _addPeople();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CardController controller;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.all(26),
        decoration: BoxDecoration(
          color: AppColors.Black,
          border: Border.all(
            color: AppColors.DarkBlue,
            style: BorderStyle.solid,
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
                color: AppColors.Pink, offset: Offset(1, 2), blurRadius: 5.0),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomAppBar(),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.Black,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.Pink,
                        offset: Offset(4, 3),
                        blurRadius: 6.0),
                  ],
                ),
                height: MediaQuery.of(context).size.height * 0.63,
                width: 280,
                margin: EdgeInsets.only(top: 20),
                child: new TinderSwapCard(
                  animDuration: 300,
                  orientation: AmassOrientation.BOTTOM,
                  totalNum: personImages.length,
                  stackNum: 3,
                  swipeEdge: 3.0,
                  maxWidth: MediaQuery.of(context).size.width * 1.0,
                  maxHeight: MediaQuery.of(context).size.width * 1.7,
                  minWidth: MediaQuery.of(context).size.width * 0.18,
                  minHeight: MediaQuery.of(context).size.width * 0.4,
                  cardBuilder: (context, index) => Card(
                    child: Container(
                      child: Image.asset(
                        '${personImages[index]}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  cardController: controller = CardController(),
                  swipeUpdateCallback:
                      (DragUpdateDetails details, Alignment align) {
                    /// Get swiping card's alignment
                    if (align.x < 0) {
                      //Card is LEFT swiping
                    } else if (align.x > 0) {
                      //Card is RIGHT swiping
                    }
                  },
                  swipeCompleteCallback:
                      (CardSwipeOrientation orientation, int index) {
                    /// Get orientation & index of swiped card!
                  },
                ),
              ),
            ),
            Container(
              width: 280,
              height: 90,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 34,
                    ),
                    child: CustomOutlineButton.CustomFlatButton(
                      buttonText: "Accept",
                    ),
                  ),
                  SizedBox(
                    width: 32,
                  ),
                  CustomOutlineButton.CustomFlatButton(
                    buttonText: "Reject",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
