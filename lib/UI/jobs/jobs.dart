import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:flutterhackathon/MODEL/job.dart';
import 'package:flutterhackathon/MODEL/person.dart';
import 'package:flutterhackathon/RESOURCES/COMPONENTS/app_bar.dart';
import 'package:flutterhackathon/RESOURCES/COMPONENTS/flat_button.dart';
import 'package:flutterhackathon/RESOURCES/VALUES/app_color.dart';

class JobsPage extends StatefulWidget {
  @override
  _JobsPageState createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> with TickerProviderStateMixin {
  Random rnd = new Random();

  List<Person> people = [
    Person(
      id: 343,
      images: 'assets/images/person1.jpg',
      jobDescription:
          Job(title: 'Rescue pet from Pet Stuck in tree', score: 100),
    ),
    Person(
      id: 3454,
      images: 'assets/images/person2.jpg',
      jobDescription: Job(title: 'Fix my Cyber Truck Mark III', score: 200),
    ),
    Person(
      id: 5654,
      images: 'assets/images/person3.jpg',
      jobDescription:
          Job(title: 'Rescue pet from Pet Stuck in tree', score: 400),
    ),
    Person(
      id: 1234,
      images: 'assets/images/person1.jpg',
      jobDescription: Job(title: 'Fix my Cyber Truck Mark III', score: 500),
    ),
  ];

  _addPeople() {
    int count = rnd.nextInt(100) + 45;
    for (int i = 0; i < count; i++) {
      people.add(
        Person(
            id: rnd.nextInt(356000) + 2,
            images: 'assets/images/person${rnd.nextInt(3) + 1}.jpg',
            jobDescription: Job(
                title: 'Fix my Cyber Truck Mark III',
                score: rnd.nextInt(1000) + 10)),
      );
    }
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
                  totalNum: people.length,
                  stackNum: 3,
                  swipeEdge: 3.0,
                  maxWidth: MediaQuery.of(context).size.width * 0.8,
                  maxHeight: MediaQuery.of(context).size.width * 2.99,
                  minWidth: MediaQuery.of(context).size.width * 0.458,
                  minHeight: MediaQuery.of(context).size.width * 0.764,
                  cardBuilder: (context, index) => Card(
                    child: Stack(
                      children: [
                        Container(
                          child: Image.asset(
                            '${people[index].images}',
                            height: MediaQuery.of(context).size.height * 0.63,
                            width: 280,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: 6,
                          bottom: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 132,
                                height: 19,
                                child: Text(
                                  'Citizen ID:${people[index].id}',
                                  style: TextStyle(
                                    color: AppColors.TiffanyBlue,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Container(
                                width: 234,
                                height: 19,
                                child: Text(
                                  '${people[index].jobDescription.title}',
                                  style: TextStyle(
                                    color: AppColors.TiffanyBlue,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Container(
                                width: 180,
                                height: 19,
                                child: Text(
                                  'Score: ${people[index].jobDescription.score} citizen credit(CC)',
                                  style: TextStyle(
                                    color: AppColors.TiffanyBlue,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                      onPressed: () {
                        controller.triggerLeft();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 32,
                  ),
                  CustomOutlineButton.CustomFlatButton(
                    buttonText: "Reject",
                    onPressed: () {
                      controller.triggerRight();
                    },
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
