import 'package:auto_route/auto_route_annotations.dart';
import 'package:gitboy/page/home/home_page.dart';
import 'package:gitboy/page/setting/setting_page.dart';
import 'package:gitboy/page/setting/setting_theme_page.dart';
import '../page/welcome/welcome_page.dart';
import '../page/login/login_page.dart';

@MaterialAutoRouter(generateNavigationHelperExtension: true)
class $AppRouter {
  @initial
  WelcomePage welComePage;

  LoginPage loginPage;

  HomePage homePage;

  //===============================================【设置】
  SettingPage settingPage; //设置页面
  SettingThemePage settingThemePage; //主题设置

//  @CupertinoRoute(fullscreenDialog: true)

}
