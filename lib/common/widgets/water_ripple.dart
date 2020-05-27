import 'dart:math';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WaterRipple extends StatefulWidget {
  /// 底部圆角
  double bottomRadius;

  WaterRipple({@required this.bottomRadius});

  @override
  _WaterRippleState createState() => _WaterRippleState();
}

class _WaterRippleState extends State<WaterRipple> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    _controller.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.dismissed:
          print("dismissed");
          break;
        case AnimationStatus.forward:
          print("forward");
          break;
        case AnimationStatus.reverse:
          print("reverse");
          break;
        case AnimationStatus.completed:
          print("completed");
          break;
      }
    });
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    Color startColor = themeData.primaryColor;
    Color endColor = themeData.scaffoldBackgroundColor.withAlpha(100);
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: BottomClipper(offset: 1, moveTo: 1.3, height: 2.5, animatedValue: _animation.value),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(widget.bottomRadius)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [startColor, endColor])),
            height: 60,
          ),
        ),
        ClipPath(
          clipper: BottomClipper(offset: 1, moveTo: 1, height: 2, animatedValue: _animation.value),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(widget.bottomRadius)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [startColor, endColor])),
            height: 60,
          ),
        ),
      ],
    );
  }
}

class BottomClipper extends CustomClipper<Path> {
  double offset;
  double moveTo;
  double animatedValue;
  double height;

  BottomClipper({this.offset, this.moveTo, this.height, this.animatedValue});

  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    double side = min(size.width, size.height);
    double radius = side / 2.0;
    double waveWidth = size.width / 1.2;
    double waveHeight = size.height / (height);
    var path = Path();
    path.moveTo((this.animatedValue - (moveTo)) * waveWidth, radius);

    for (double i = -waveWidth; i < side; i += waveHeight) {
      double x1 = waveWidth / 4 * offset;
      double x2 = waveWidth / 2 * offset;
      path.relativeQuadraticBezierTo(x1, -waveHeight, x2, 0);
      path.relativeQuadraticBezierTo(x1, waveHeight, x2, 0);
    }
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
