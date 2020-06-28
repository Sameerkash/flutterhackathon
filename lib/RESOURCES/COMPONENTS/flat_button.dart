import 'package:flutter/material.dart';
import 'package:flutterhackathon/RESOURCES/VALUES/app_color.dart';

class CustomOutlineButton extends StatelessWidget {
  final String buttonText;

  CustomOutlineButton.CustomFlatButton({@required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 40,
      child: FlatButton(
        onPressed: () {},
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.TiffanyBlue,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: AppColors.Black,
        border: Border.all(
          color: AppColors.DarkBlue,
          style: BorderStyle.solid,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          new Radius.circular(20.0)
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.Pink,
            offset: Offset(0, 3),
            blurRadius: 6.0
          ),
        ],
      ),
    );
  }
}
