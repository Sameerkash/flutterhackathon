import 'package:flutter/material.dart';

class ImageScannerAnimation extends AnimatedWidget {
  final bool stopped;
  final double width;

  ImageScannerAnimation(this.stopped, this.width,
      {Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    final scorePosition = (animation.value * 600);

    Color color1 = Color.fromRGBO(1, 1, 154, 1);
    Color color2 = Color.fromRGBO(61, 3, 39, 0.2);

    if (animation.status == AnimationStatus.reverse) {
      color1 = Color.fromRGBO(61, 3, 39, 0.2);
      color2 = Color.fromRGBO(1, 1, 154, 1);
    }

    return Positioned(
        bottom: scorePosition,
        left: 0.0,
        child: Opacity(
            opacity: (stopped) ? 0.0 : 1.0,
            child: Container(
              height: 90.0,
              width: width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.9],
                colors: [color1, color2],
              )),
            )));
  }
}
