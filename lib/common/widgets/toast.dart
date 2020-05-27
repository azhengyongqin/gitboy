import 'dart:ui';

import 'package:flutter/material.dart';
import '../utils/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool> showToast({
  @required String msg,
  Color backgroundColor,
  Color textColor = Colors.white,
}) async {
  return await Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: backgroundColor ?? Colors.grey[600],
    textColor: textColor,
    fontSize: duSetFontSize(16),
  );
}
