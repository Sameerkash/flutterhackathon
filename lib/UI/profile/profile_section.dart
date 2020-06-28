import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterhackathon/constants.dart';
import 'package:flutterhackathon/UTIL/size_util.dart';
import '../../UTIL/size_util.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterhackathon/widgets/customs/custom_rect.dart';

class ProfileSection extends StatefulWidget {
  @override
  _ProfileSectionState createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Container(
          padding: EdgeInsets.only(top: SizeConfig.safeHeight * 0.02),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CustomPaint(
                    painter: MyPainter(),
                    child: Container(
                      padding: EdgeInsets.all(SizeConfig.safeWidth * 0.03),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 3, color: Color.fromRGBO(197, 1, 80, 1)),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Color.fromRGBO(28, 28, 137, 1).withOpacity(0.7),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Text(
                              'Welcome back,',
                              style: TextStyle(
                                color: kTertiaryColor,
                                fontSize: 13,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 3.0,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              'X-Delta Joe',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 3.0,
                                    color: Colors.lightBlueAccent,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.safeWidth * 0.1,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 3, color: Color.fromRGBO(197, 1, 80, 1)),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color.fromRGBO(28, 28, 137, 1).withOpacity(0.7),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: ImageIcon(
                      AssetImage('assets/images/menu.png'),
                      size: SizeConfig.safeWidth * 0.1,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.safeHeight * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(19))),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 3, color: Color.fromRGBO(197, 1, 80, 1)),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Color.fromRGBO(28, 28, 137, 1).withOpacity(0.7),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Image(
                        image: AssetImage('assets/images/keenu.jpg'),
                        height: SizeConfig.safeHeight * 0.15,
                        width: SizeConfig.safeWidth * 0.28,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Card(
                    child: CustomPaint(
                      painter: MyPainter(),
                      child: Container(
                        padding: EdgeInsets.all(SizeConfig.safeHeight * 0.012),
                        decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.green),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(28, 28, 137, 1)
                                  .withOpacity(0.7),
                              spreadRadius: 5,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Card(
                          color: kPrimaryColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Name : X-Delta Joe',
                                style: TextStyle(
                                  color: kTertiaryColor,
                                  fontSize: SizeConfig.safeWidth * 0.035,
                                ),
                              ),
                              Text(
                                'Citizen ID: 533-148',
                                style: TextStyle(
                                  color: kTertiaryColor,
                                  fontSize: SizeConfig.safeWidth * 0.035,
                                ),
                              ),
                              Text(
                                'Covid-22 : Immune',
                                style: TextStyle(
                                  color: kTertiaryColor,
                                  fontSize: SizeConfig.safeWidth * 0.035,
                                ),
                              ),
                              Text(
                                'Digital Print : XXX-29Y',
                                style: TextStyle(
                                  color: kTertiaryColor,
                                  fontSize: SizeConfig.safeWidth * 0.035,
                                ),
                              ),
                              Text(
                                'Age : 29/53 yrs',
                                style: TextStyle(
                                  color: kTertiaryColor,
                                  fontSize: SizeConfig.safeWidth * 0.035,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.safeHeight * 0.04,
              ),
              ProfileCards(
                text1: 'Citizenship Credit',
                text2: '50,000   ',
                icon: Icons.monetization_on,
                onPressed: () {},
              ),
              ProfileCards(
                text1: 'Available Oxygen',
                text2: '63%    ',
                icon: Icons.thumb_up,
                onPressed: () {},
              ),
              ProfileCards(
                  text1: 'Energy Balance',
                  text2: '123 bpm    ',
                  icon: Icons.all_inclusive,
                  onPressed: () {}),
              SizedBox(height: SizeConfig.safeWidth * 0.05),
              Container(
                padding: EdgeInsets.only(
                    left: SizeConfig.safeWidth * 0.03,
                    right: SizeConfig.safeWidth * 0.07),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Crimes Committed',
                      style: TextStyle(
                        color: kTertiaryColor,
                        fontSize: SizeConfig.safeWidth * 0.065,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.warning,
                      color: Colors.lightGreen,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                height: SizeConfig.safeWidth * 0.5,
                width: SizeConfig.safeWidth * 0.5,
                child: Swiper(
                  loop: false,
                  controller: SwiperController(),
                  itemCount: 3,
                  scale: 0.6,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      shadowColor: Colors.white10,
                      color: kCardsColor,
                      child: CustomPaint(
                        painter: MyPainter(),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 19),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(crimes[index],
                                  style: TextStyle(
                                    color: kTertiaryColor,
                                    fontSize: SizeConfig.safeWidth * 0.035,
                                  )),
                              Text(categories[index],
                                  style: TextStyle(
                                    color: kTertiaryColor,
                                    fontSize: SizeConfig.safeWidth * 0.035,
                                  )),
                              Text(severity[index],
                                  style: TextStyle(
                                    color: kTertiaryColor,
                                    fontSize: SizeConfig.safeWidth * 0.035,
                                  )),
                              Text(date[index],
                                  style: TextStyle(
                                    color: kTertiaryColor,
                                    fontSize: SizeConfig.safeWidth * 0.035,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  viewportFraction: 0.7,
                  itemHeight: SizeConfig.safeWidth * 0.5,
                  itemWidth: SizeConfig.safeWidth * 0.5,
                ),
              ),
              SizedBox(height: SizeConfig.safeHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCards extends StatefulWidget {
  ProfileCards({this.text1, this.text2, this.icon, @required this.onPressed});
  final String text1;
  final String text2;
  final IconData icon;
  final Function onPressed;
  @override
  _ProfileCardsState createState() => _ProfileCardsState();
}

class _ProfileCardsState extends State<ProfileCards>
    with TickerProviderStateMixin<ProfileCards> {
  double _scale;
  AnimationController _controller;

  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = 10.0;
    _scale = 1 - _controller.value;
    return Container(
      margin: EdgeInsets.all(SizeConfig.safeWidth * 0.02),
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Color.fromRGBO(197, 1, 80, 1)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(28, 28, 137, 1).withOpacity(0.7),
            spreadRadius: 5,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.black,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: GestureDetector(
        onTap: () {
          _controller.forward().then((val) {
            _controller.reverse().then((val) {
              widget.onPressed();
            });
          });
        },
        child: Transform.scale(
          scale: _scale,
          child: Container(
            height: SizeConfig.safeHeight * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Text(
                    widget.text1,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: SizeConfig.safeWidth * 0.04,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      widget.text2,
                      style: TextStyle(
                        color: kTertiaryColor,
                        fontSize: SizeConfig.safeWidth * 0.04,
                      ),
                    ),
                    Icon(widget.icon, color: kTertiaryColor),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
