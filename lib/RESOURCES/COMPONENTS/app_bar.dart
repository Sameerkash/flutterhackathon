import 'package:flutter/material.dart';
import 'package:flutterhackathon/RESOURCES/VALUES/app_color.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 50,
      margin: EdgeInsets.only(
        top: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 50,
          ),
          Container(
            width: 120,
            height: 50,
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: AppColors.Black,
              border: Border.all(
                color: AppColors.Pink,
                style: BorderStyle.solid,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                    color: AppColors.DarkBlue,
                    offset: Offset(0, 3),
                    blurRadius: 6.0),
              ],
            ),
            child: Text(
              'JOBS',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: AppColors.TiffanyBlue,
              ),
            ),
          ),
          Container(
            width: 48,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.Pink,
                width: 2,
              ),
            ),
            child: FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {Navigator.pop(context);},
              child: Image.asset(
                "assets/images/menu.png",
                width: 24,
                height: 24,
                color: AppColors.TiffanyBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
