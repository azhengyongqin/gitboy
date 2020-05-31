import 'package:flutter/material.dart';
import 'package:gitboy/common/utils/utils.dart';

// ignore: must_be_immutable
class Avatar extends StatelessWidget {
  String src;
  double radius;
  double borderRadius;

  Avatar({@required this.src, this.radius = 36, this.borderRadius = 36});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: duSetHeight(radius),
      height: duSetHeight(radius),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(src),
        ),
      ),
    );
  }
}
