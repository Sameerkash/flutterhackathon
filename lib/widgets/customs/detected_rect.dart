import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CameraPainter extends CustomPainter {
  Map rect;
  CameraPainter(this.rect);

  @override
  void paint(Canvas canvas, Size size) {
    if (rect.isNotEmpty) {
      final line = ui.PointMode.polygon;

      final paint = Paint();
      paint.color = Colors.blue;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 3.0;

      final paintLine = Paint()
        ..color = Colors.purple
        ..strokeWidth = 1
        ..strokeCap = StrokeCap.round;

      String detecting = "${rect["label"]}";

      TextSpan span = TextSpan(
          style: TextStyle(
              color: Colors.green,
              fontSize: 25,
              backgroundColor: Colors.purple),
          text: detecting);

      TextPainter tp = TextPainter(
          text: span,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr);

      double x, y, w, h;
      x = rect["x"] * size.width;
      y = rect["y"] * size.height;
      w = rect["w"] * size.width;
      h = rect["h"] * size.height;
      final lineLabel = [
        Offset(x, y),
        Offset(x + 10, y - 50),
      ];
      Rect rect1 = Offset(x, y) & Size(w, h);

      canvas.drawRect(rect1, paint);

      tp.layout();
      tp.paint(canvas, Offset(x, y - 70));
      canvas.drawPoints(line, lineLabel, paintLine);
    }
  }

  @override
  bool shouldRepaint(CameraPainter oldDelegate) => oldDelegate.rect != rect;
}
