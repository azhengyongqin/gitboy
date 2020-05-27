import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gitboy/common/utils/screen.dart';
import 'package:gitboy/common/values/values.dart';
import 'package:gitboy/common/widgets/button.dart';
import 'package:gitboy/common/widgets/logo.dart';
import 'package:gitboy/router/router.gr.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  get theme => Theme.of(context);

  Widget _label() {
    return Container(
        margin: EdgeInsets.only(top: 40, bottom: 20),
        child: Column(
          children: <Widget>[
            Text(
              '稳定・高效・安全',
              style: TextStyle(color: Colors.white, fontSize: duSetFontSize(18)),
            ),
            SizedBox(
              height: duSetHeight(20),
            ),
            Text(
              '码云 Gitee - 云端软件开发协作平台',
              style: TextStyle(color: Colors.white, fontSize: duSetFontSize(20), fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: duSetHeight(20),
            ),
            Text(
              '帮助个人、团队、企业轻松实现 Git/SVN 代码托管、协作开发',
              style: TextStyle(
                color: Colors.white,
                fontSize: duSetFontSize(12),
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(
              height: duSetHeight(20),
            ),
            SvgPicture.asset(
              'assets/svg/gitee_log.svg',
              width: duSetWidth(100),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    // 高度去掉 顶部，底部导航
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: true);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: duSetWidth(20)),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [theme.primaryColor.withAlpha(100), theme.primaryColor])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Logo(),
              SizedBox(
                height: 20,
              ),
              _label(),
              SizedBox(
                height: 80,
              ),
              btnFlatButtonWidget(
                width: duSetWidth(150),
                context: context,
                title: '开始',
                onPressed: () {
                  ExtendedNavigator.ofRouter<AppRouter>().pushLoginPage();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
