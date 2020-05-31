import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

List<double> getRandom(int size) {
  var rs = new List<double>();
  var random = new Random();
  for (int i = 0; i < size; i++) {
    rs.add(random.nextDouble() - 0.1);
  }
  return rs;
}

class Gitboy extends StatefulWidget {
  @override
  _GitboyState createState() => _GitboyState();
}

class _GitboyState extends State<Gitboy> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  var rs = new List<double>();

  @override
  void initState() {
    _controller = AnimationController(duration: Duration(seconds: 2), vsync: this);
//      ..addStatusListener((status) {
//        switch (status) {
//          case AnimationStatus.dismissed:
//            rs = getRandom(10);
//            _controller.forward();
//            print('dismissed');
//            break;
//          case AnimationStatus.forward:
////            print("forward");
//            break;
//          case AnimationStatus.reverse:
////            print("reverse");
//            break;
//          case AnimationStatus.completed:
//            _controller.reverse();
//            print('completed');
//            break;
//        }
//      });
    _animation = new CurvedAnimation(parent: _controller, curve: Curves.decelerate)
      ..addListener(() {
        setState(() {});
      });
    rs = getRandom(15);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipPainter(
        animatedValue: _animation.value,
        rs: rs,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor.withAlpha(60),
              Theme.of(context).primaryColor,
            ],
          ),
        ),
      ),
    );
  }
}

class ClipPainter extends CustomClipper<Path> {
  Path path;
  double animatedValue;
  List<double> rs;

  ClipPainter({this.animatedValue, this.rs}) {
    path = new Path();
  }

  calculationControlPoint(List<Offset> points) async {
    if (points == null || points.length == 0) {
      return;
    }
    if (points.length == 1) {
      path.lineTo(points[0].dx, points[0].dy);
      return;
    }

    path.lineTo(points[0].dx, points[0].dy);
    for (int i = 0; i < points.length - 1; i++) {
      Offset sp = points[i];
      Offset ep = points[i + 1];
      Offset c1 = new Offset((sp.dx + ep.dx) / 2, sp.dy);
      Offset c2 = new Offset((sp.dx + ep.dx) / 2, ep.dy);
      path.cubicTo(c1.dx, c1.dy, c2.dx, c2.dy, ep.dx, ep.dy);
    }
  }

  @override
  Path getClip(Size size) {
//    print(r);

    var height = size.height * 0.5;
    var width = size.width;
    path.lineTo(0, 0);
    var points = List<Offset>.generate(this.rs.length, (index) {
      return Offset(width * index / this.rs.length, height * (1 + this.rs[index] * this.animatedValue));
    });

    points.add(Offset(width, height * (1 + this.rs[this.rs.length ~/ 2] * this.animatedValue)));

//    List<Offset> points = [
//      Offset(0, height),
//      Offset(width * 0.1, height * (1 + 0.2 * this.animatedValue)),
//      Offset(width * 0.15, height * (1 + 0.3 * this.animatedValue)),
//      Offset(width * 0.2, height * (1 + 0.7 * this.animatedValue)),
//      Offset(width * 0.23, height * (1 + 0.5 * this.animatedValue)),
//      Offset(width * 0.25, height * (1 + 0.7 * this.animatedValue)),
//      Offset(width * 0.3, height * (1 + 0.3 * this.animatedValue)),
//      Offset(width * 0.4, height * (1 + 0.5 * this.animatedValue)),
//      Offset(width * 0.5, height * (1 + 0.3 * this.animatedValue)),
//      Offset(width * 0.6, height * (1 + 0.5 * this.animatedValue)),
//      Offset(width * 0.75, height * (1 + 0.2 * this.animatedValue)),
//      Offset(width * 0.8, height * (1 + 0.2 * this.animatedValue)),
//      Offset(width * 0.84, height * (1 + 0.3 * this.animatedValue)),
//      Offset(width * 0.95, height * (1 + 0.1 * this.animatedValue)),
//      Offset(width, height * (1 + 0.5 * this.animatedValue)),
//      Offset(width, height * (1 + 0.1 * this.animatedValue)),
//    ];

    calculationControlPoint(points);

    path.lineTo(width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
