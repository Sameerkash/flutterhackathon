import 'package:flutter/material.dart';

const double _kRadius = 5;
const double _kBorderWidth = 4;

class MyPainter extends CustomPainter {
  MyPainter();

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

    canvas.drawRRect(rrectBorder, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
