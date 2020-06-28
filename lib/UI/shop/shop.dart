import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterhackathon/RESOURCES/COMPONENTS/app_bar.dart';
import 'package:flutterhackathon/RESOURCES/VALUES/app_color.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<String> data = [
    'assets/images/item8.jpg',
    'assets/images/item3.jpg',
  ];
  int _focusedIndex = 0;
  Random rnd = new Random();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 30; i++) {
      data.add('assets/images/item${rnd.nextInt(8)+1}.jpg');
    }
  }

  @override
  Widget build(BuildContext context) {
    ScrollController controller;
    return MaterialApp(
      title: 'Vertical List Demo',
      home: Scaffold(
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
            children: <Widget>[
              CustomAppBar(
                title: 'SHOP',
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(border: Border.all(width: 2)),
                  width: 350,
                  height: 450,
                  margin: EdgeInsets.only(top: 30),
                  child: ListWheelScrollView.useDelegate(
                    controller: controller = ScrollController(
                        initialScrollOffset: 10 * 80.0,
                        keepScrollOffset: true),
                    itemExtent: 110,
                    useMagnifier: true,
                    diameterRatio: 3.1,
                    squeeze: 1,
                    physics: PageScrollPhysics(),
                    overAndUnderCenterOpacity: 1,
                    magnification: 1.25,
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: data.length,
                      builder: (context, index) {
                        return  Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
//                            bottom: 20.0
                          ),
                          child: Container(
                            height: 300.0,
                            width: MediaQuery.of(context).size.width * 0.85,
                            decoration: BoxDecoration(
                              color: AppColors.Black,
                              border: Border.all(
                                color: AppColors.Pink,
                                style: BorderStyle.solid,
                                width: 3,
                              ),
                            ),
                            child: Image.asset(data[index], fit: BoxFit.cover,),
                          ),
                        );
                      }
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
