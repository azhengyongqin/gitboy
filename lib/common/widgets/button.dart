import 'package:flutter/material.dart';
import '../utils/screen.dart';
import '../values/values.dart';

/// 扁平圆角按钮
Widget btnFlatButtonWidget({
  @required BuildContext context,
  @required String title,
  double width = double.infinity,
  double height = 48,
  Color color,
  Color fontColor,
  double fontSize,
  VoidCallback onPressed,
}) {
  var themeData = Theme.of(context);
  if (color == null) {
    color = themeData.primaryColor;
  }
  if (fontColor == null) {
    fontColor = themeData.primaryTextTheme.headline6.color;
  }
  return Container(
    width: duSetWidth(width),
    height: duSetHeight(height),
    child: FlatButton(
      onPressed: onPressed,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: Radii.k6pxRadius,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: fontColor,
          fontWeight: themeData.primaryTextTheme.headline6.fontWeight,
          fontSize: fontSize == null
              ? themeData.primaryTextTheme.headline6.fontSize
              : duSetFontSize(fontSize),
          height: 1,
        ),
      ),
    ),
  );
}
