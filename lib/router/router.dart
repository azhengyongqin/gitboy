import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:gitboy/page/home/home_page.dart';
import 'package:gitboy/page/setting/setting_page.dart';
import 'package:gitboy/page/setting/setting_theme_page.dart';
import 'package:gitboy/router/auth_guard.dart';
import '../page/welcome/welcome_page.dart';
import '../page/login/login_page.dart';

@MaterialAutoRouter(generateNavigationHelperExtension: true)
class $AppRouter {
  WelcomePage welComePage;

  @CupertinoRoute(fullscreenDialog: true)
  LoginPage loginPage;

  @initial
  HomePage homePage;

  //===============================================【设置】
  @GuardedBy([AuthGuard])
  SettingPage settingPage; //设置页面
  SettingThemePage settingThemePage; //主题设置

//  @CupertinoRoute(fullscreenDialog: true)

}
