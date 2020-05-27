import 'package:flutter/material.dart';
import '../utils/utils.dart';

class MainMenu extends StatelessWidget {
  final String title;
  final Color color;
  final IconData iconData;
  final VoidCallback onTap;

  MainMenu({@required this.title, this.color, this.iconData, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: duSetWidth(165),
        height: duSetHeight(120),
        child: Column(
          children: <Widget>[
            Container(
              width: duSetHeight(60),
              height: duSetHeight(60),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[color, color.withAlpha(240)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                  boxShadow: [
                    BoxShadow(
                        color: color.withAlpha(250),
                        offset: Offset(1, 2),
                        blurRadius: 5),
                  ]),
              child: Icon(
                iconData,
                color: Colors.white,
                size: duSetHeight(36),
              ),
            ),
            SizedBox(
              height: duSetHeight(18),
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: duSetHeight(16),
                  color: Theme.of(context).textTheme.headline6.color),
            )
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
