import 'package:flutter/material.dart';
import 'package:flutterhackathon/RESOURCES/VALUES/app_color.dart';

class HireHistoryPage extends StatefulWidget {
  @override
  _HireHistoryPageState createState() => _HireHistoryPageState();
}

class _HireHistoryPageState extends State<HireHistoryPage> {
  @override
  Widget build(BuildContext context) {
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
        child: Column(),
      ),
    );
  }
}
