import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BounceButton extends StatefulWidget {
  final SvgPicture iconImagePath;
  final Function onPressed;
  final double shadowLevel;
  final Icon icon;

  const BounceButton({
    Key key,
    this.iconImagePath,
    this.icon,
    @required this.onPressed,
    this.shadowLevel,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BounceButton(
      this.iconImagePath, this.icon, this.onPressed, this.shadowLevel);
}

class _BounceButton extends State<BounceButton>
    with TickerProviderStateMixin<BounceButton> {
  SvgPicture imagePath;
  double shadowLevel;
  Icon icon;
  bool isServiceButton;

  _BounceButton(
      SvgPicture imagePath, Icon icon, Function story, double shadow) {
    this.imagePath = imagePath;
    this.shadowLevel = shadow;
    this.icon = icon;
  }
  double _scale;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 70),
      lowerBound: 0.0,
      upperBound: 0.3,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;

    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _controller.forward().then((val) {
            _controller.reverse().then((val) {
              widget.onPressed();
            });
          });
        },
        child:
            Transform.scale(scale: _scale, child: Container(child: imagePath)));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
