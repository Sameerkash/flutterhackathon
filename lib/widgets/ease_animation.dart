import 'package:flutter/material.dart';

// this is the main stateFul class to make animation of camera button
class EaseInWidget extends StatefulWidget {
  final Widget child;
  final Function onTap;

  const EaseInWidget({Key key, @required this.child, @required this.onTap})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _EaseInWidgetState();
}

class _EaseInWidgetState extends State<EaseInWidget>
    with TickerProviderStateMixin<EaseInWidget> {
  AnimationController animController;
  Animation<double> easeInAnimation;

  @override
  void initState() {
    super.initState();

    animController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 100,
        ),
        value: 1.0);
    easeInAnimation = Tween(begin: 1.0, end: 0.65).animate(
      CurvedAnimation(
        parent: animController,
        curve: Curves.easeIn,
      ),
    );
    animController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        animController.forward().then((val) {
          animController.reverse().then((val) {
            widget.onTap();
          });
        });
      },
      child: ScaleTransition(
        scale: easeInAnimation,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }
}
