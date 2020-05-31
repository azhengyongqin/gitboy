// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gitboy/page/login/login_page.dart';
import 'package:gitboy/page/home/home_page.dart';
import 'package:gitboy/router/auth_guard.dart';
import 'package:gitboy/page/setting/setting_page.dart';
import 'package:gitboy/page/setting/setting_theme_page.dart';
import 'package:gitboy/page/my/my_page.dart';

abstract class Routes {
  static const loginPage = '/login-page';
  static const homePage = '/';
  static const settingPage = '/setting-page';
  static const settingThemePage = '/setting-theme-page';
  static const myPage = '/my-page';
  static const all = {
    loginPage,
    homePage,
    settingPage,
    settingThemePage,
    myPage,
  };
}

class AppRouter extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;
  @override
  Map<String, List<Type>> get guardedRoutes => {
        Routes.homePage: [AuthGuard],
        Routes.myPage: [AuthGuard],
      };
  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<AppRouter>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.loginPage:
        if (hasInvalidArgs<LoginPageArguments>(args)) {
          return misTypedArgsRoute<LoginPageArguments>(args);
        }
        final typedArgs = args as LoginPageArguments ?? LoginPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              LoginPage(key: typedArgs.key, title: typedArgs.title),
          settings: settings,
          fullscreenDialog: true,
        );
      case Routes.homePage:
        if (hasInvalidArgs<HomePageArguments>(args)) {
          return misTypedArgsRoute<HomePageArguments>(args);
        }
        final typedArgs = args as HomePageArguments ?? HomePageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomePage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.settingPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SettingPage(),
          settings: settings,
        );
      case Routes.settingThemePage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SettingThemePage(),
          settings: settings,
        );
      case Routes.myPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => MyPage(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//LoginPage arguments holder class
class LoginPageArguments {
  final Key key;
  final String title;
  LoginPageArguments({this.key, this.title});
}

//HomePage arguments holder class
class HomePageArguments {
  final Key key;
  HomePageArguments({this.key});
}

// *************************************************************************
// Navigation helper methods extension
// **************************************************************************

extension AppRouterNavigationHelperMethods on ExtendedNavigatorState {
  Future pushLoginPage({
    Key key,
    String title,
  }) =>
      pushNamed(
        Routes.loginPage,
        arguments: LoginPageArguments(key: key, title: title),
      );

  Future pushHomePage({Key key, OnNavigationRejected onReject}) => pushNamed(
        Routes.homePage,
        arguments: HomePageArguments(key: key),
        onReject: onReject,
      );

  Future pushSettingPage() => pushNamed(Routes.settingPage);

  Future pushSettingThemePage() => pushNamed(Routes.settingThemePage);

  Future pushMyPage() => pushNamed(Routes.myPage);
}
