import 'package:flutter/material.dart';
import 'package:flutterhackathon/RESOURCES/VALUES/app_color.dart';

class JobForm extends StatelessWidget {
  final String image;
  final String job;
  final double height;
  final double width;
  final double distance;

  JobForm({this.image, this.job, this.height, this.width, this.distance});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width ?? 240,
        height: height ?? 120,
        margin: EdgeInsets.only(
          top: 10,
          right: distance ?? 3,
        ),
        child: Stack(
          children: [
          Container(
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
            child: Image.asset(
            image,
            fit: BoxFit.fill,
              width: 250,
              height: 120,),
          ),
            Positioned(
              left: 3,
              bottom: 5,
              child: Text(
                job,
                style: TextStyle(
                  color: AppColors.TiffanyBlue,
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
