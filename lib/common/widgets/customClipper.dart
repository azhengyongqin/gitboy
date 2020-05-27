import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ClipPainter extends CustomClipper<Path> {
  Path path;

  ClipPainter() {
    path = new Path();
  }

  calculationControlPoint(List<Offset> points) {
    if (points == null || points.length == 0) {
      return;
    }
    if (points.length == 1) {
      path.lineTo(points[0].dx, points[0].dy);
      return;
    }

    path.lineTo(points[0].dx, points[0].dy);
    for (int i = 0; i < points.length - 1; ++i) {
      Offset sp = points[i];
      Offset ep = points[i + 1];
      Offset c1 = new Offset((sp.dx + ep.dx) / 2, sp.dy);
      Offset c2 = new Offset((sp.dx + ep.dx) / 2, ep.dy);
      path.cubicTo(c1.dx, c1.dy, c2.dx, c2.dy, ep.dx, ep.dy);
    }
  }

  @override
  Path getClip(Size size) {
    var height = size.height * 0.5;
    var width = size.width;
    path.lineTo(0, 0);

    List<Offset> points = [
      Offset(0, height),
      Offset(width * 0.1, height*0.8),
      Offset(width * 0.15, height * 1.3),
      Offset(width * 0.2, height * 0.7),
      Offset(width * 0.23, height * 1.5),
      Offset(width * 0.25, height * 1.7),
      Offset(width * 0.3, height * 1.3),
      Offset(width * 0.4, height * 1.5),
      Offset(width * 0.5, height * 1.3),
      Offset(width * 0.6, height * 1.5),
      Offset(width * 0.75, height * 1.2),
      Offset(width * 0.8, height * 0.8),
      Offset(width * 0.84, height * 1.3),
      Offset(width * 0.95, height * 0.9),
      Offset(width, height * 1.5),
      Offset(width, height * 0.9),
    ];

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
