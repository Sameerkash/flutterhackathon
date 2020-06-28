import 'package:flutter/material.dart';
import 'dart:ui' as ui;

const double _kRadius = 5;
const double _kBorderWidth = 4;

class MyPainter extends CustomPainter {
  bool isCamera;
  MyPainter(
    this.isCamera,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final rrectBorder = RRect.fromRectAndRadius(
        Offset(3, 3) & Size(size.width - 5, size.height - 5),
        Radius.circular(_kRadius));

    final rrectShadow =
        RRect.fromRectAndRadius(Offset(0, 0) & size, Radius.circular(_kRadius));

    final rrectShadow1 = RRect.fromRectAndRadius(
        Offset(0, 0) & Size(size.width - 4, size.height - 7),
        Radius.circular(_kRadius));

    final rrectShadow2 =
        RRect.fromRectAndRadius(Offset(2, 0) & size, Radius.circular(_kRadius));
    final rrectShadow3 = RRect.fromRectAndRadius(
        Offset(10, 3) & Size(size.width - 16, size.height - 7),
        Radius.circular(_kRadius));

    final shadowPaint = Paint()
      ..strokeWidth = _kBorderWidth
      ..color = Color.fromRGBO(59, 22, 126, 1)
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 5);

    final shadowPaint1 = Paint()
      ..strokeWidth = _kBorderWidth
      ..color = Color.fromRGBO(93, 0, 35, 1)
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 3);

    final borderPaint = Paint()
      ..strokeWidth = _kBorderWidth
      ..color = Color.fromRGBO(43, 43, 211, 1)
      ..style = PaintingStyle.stroke;

    canvas.drawRRect(rrectShadow, shadowPaint);
    canvas.drawRRect(rrectShadow1, shadowPaint);
    canvas.drawRRect(rrectShadow2, shadowPaint1);
    canvas.drawRRect(rrectShadow3, shadowPaint1);
    //main drawing
    canvas.drawRRect(rrectBorder, borderPaint);

    if (isCamera == true) {
      final pointMode = ui.PointMode.polygon;

      final pointOne = [
        Offset(40, 130),
        Offset(40, 50),
        Offset(130, 50),
      ];

      final pointTwo = [
        Offset(size.width - 40, 130),
        Offset(size.width - 40, 50),
        Offset(size.width - 130, 50),
      ];

      final pointThree = [
        Offset(40, size.height - 130),
        Offset(40, size.height - 40),
        Offset(130, size.height - 40),
      ];

      final pointFour = [
        Offset(size.width - 130, size.height - 40),
        Offset(size.width - 40, size.height - 40),
        Offset(size.width - 40, size.height - 130),
      ];

      final paint = Paint()
        ..color = Colors.purple
        ..strokeWidth = 4
        ..strokeCap = StrokeCap.round;

      canvas.drawPoints(pointMode, pointOne, paint);
      canvas.drawPoints(pointMode, pointTwo, paint);
      canvas.drawPoints(pointMode, pointThree, paint);
      canvas.drawPoints(pointMode, pointFour, paint);
    }
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => true;
}
