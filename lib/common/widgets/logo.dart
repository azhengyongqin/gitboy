import 'package:flutter/material.dart';
import 'package:gitboy/common/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'G',
          style: GoogleFonts.righteous(
            textStyle: theme.textTheme.headline4,
            fontSize: duSetFontSize(80),
            fontWeight: FontWeight.w700,
            color: theme.cardColor,
          ),
          children: [
            TextSpan(
              text: 'it',
              style: TextStyle(color: theme.textTheme.bodyText1.color, fontSize: 40),
            ),
            TextSpan(
              text: 'b',
              style: TextStyle(color: theme.cardColor, fontSize: 40),
            ),
            TextSpan(
              text: 'o',
              style: TextStyle(color: Color(0xffc71c22), fontSize: 40),
            ),
            TextSpan(
              text: 'y',
              style: TextStyle(color: theme.cardColor, fontSize: 40),
            ),
          ]),
    );
  }
}
