import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final Color color;
  final String buttonText;
  final Function onPressed;
  final double height;
  final double width;
  final IconData icon;

  PrimaryButton(
      {this.color,
      this.icon,
      @required this.buttonText,
      @required this.onPressed,
      this.height,
      this.width});

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton>
    with TickerProviderStateMixin<PrimaryButton> {
  double _scale;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = 10.0;
    _scale = 1 - _controller.value;

    return GestureDetector(
      onTap: () {
        _controller.forward().then((val) {
          _controller.reverse().then((val) {
            widget.onPressed();
          });
        });
      },
      child: Transform.scale(
        scale: _scale,
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            border: Border.all(width: 3, color: Color.fromRGBO(197, 1, 80, 1)),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(28, 28, 137, 1).withOpacity(0.7),
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Colors.black,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: widget.icon == null
              ? Center(
                  child: Text(
                    widget.buttonText,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(
                      widget.icon,
                      color: Colors.green[200],
                      size: 60,
                    ),
                    Text(
                      widget.buttonText,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
