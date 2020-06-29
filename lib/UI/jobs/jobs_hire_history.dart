import 'package:flutter/material.dart';
import 'package:flutterhackathon/MODEL/job.dart';
import 'package:flutterhackathon/MODEL/person.dart';
import 'package:flutterhackathon/RESOURCES/COMPONENTS/app_bar.dart';
import 'package:flutterhackathon/RESOURCES/COMPONENTS/job_form.dart';
import 'package:flutterhackathon/RESOURCES/VALUES/app_color.dart';
import 'package:flutterhackathon/UTIL/size_util.dart';
import 'package:flutterhackathon/widgets/customs/custom_rect.dart';

import '../../constants.dart';

class HireHistoryPage extends StatefulWidget {
  @override
  _HireHistoryPageState createState() => _HireHistoryPageState();
}

List<Person> people = [
  Person(
    id: 343,
    images: 'assets/images/item4.jpg',
    jobDescription: Job(title: 'Rescue pet from tree', score: 100),
  ),
  Person(
    id: 3454,
    images: 'assets/images/item1.jpg',
    jobDescription: Job(title: 'Fix my Cyber Truck', score: 200),
  ),
  Person(
    id: 5654,
    images: 'assets/images/item2.jpg',
    jobDescription: Job(title: 'Meet at hansau', score: 400),
  ),
  Person(
    id: 1234,
    images: 'assets/images/item3.jpg',
    jobDescription: Job(title: 'Fix my Cyber ', score: 500),
  ),
];

class _HireHistoryPageState extends State<HireHistoryPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.Black,
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
          children: [
            CustomAppBar(
              title: 'Hire History',
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: SizeConfig.safeHeight * 0.04,
                    ),
                    padding: EdgeInsets.only(
                        left: SizeConfig.safeWidth * 0.03,
                        right: SizeConfig.safeWidth * 0.07),
                    child: Text(
                      'Active missions',
                      style: TextStyle(
                        color: AppColors.TiffanyBlue,
                        fontSize: SizeConfig.safeWidth * 0.065,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Container(
                    height: 230,
                    margin: EdgeInsets.only(left: 15),
                    child: ListView.builder(
                      itemCount: people.length,
                      itemBuilder: (_, int index) {
                        final job = people[index];
                        return JobForm(
                          image: job.images,
                          job: job.jobDescription.title,
                          distance: 16,
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: SizeConfig.safeHeight * 0.04,
                    ),
                    padding: EdgeInsets.only(
                        left: SizeConfig.safeWidth * 0.03,
                        right: SizeConfig.safeWidth * 0.07),
                    child: Text(
                      'Previous missions',
                      style: TextStyle(
                        color: AppColors.TiffanyBlue,
                        fontSize: SizeConfig.safeWidth * 0.065,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    shadowColor: Colors.white10,
                    color: kCardsColor,
                    child: CustomPaint(
                      painter: MyPainter(false),
                      child: Container(
                        height: 160,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 19),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: people.length,
                          itemBuilder: (_, int index) {
                            final job = people[index];
                            return JobForm(
                              image: job.images,
                              job: job.jobDescription.title,
                              height: 100,
                              width: 100,
                              distance: 16,
                            );
                          },
                        ),
                      ),
                    ),
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
