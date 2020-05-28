import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import './router/router.gr.dart';
import './common/provider/providers.dart';
import './global.dart';
import 'router/auth_guard.dart';

void main() => Global.init().then((value) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildMaterialApp({ThemeData theme, ThemeData darkTheme}) {
      return MaterialApp(
        localeListResolutionCallback: (List<Locale> locales, Iterable<Locale> supportedLocales) {
          return Locale('zh', 'CN');
        },
        localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {
          return Locale('zh', 'CN');
        },
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalEasyRefreshLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('zh', 'CN'),
          const Locale('en', 'US'),
        ],
        debugShowCheckedModeBanner: false,
        title: '网络管控平台',
        theme: theme?.copyWith(
          platform: TargetPlatform.iOS,
        ),
        darkTheme: darkTheme?.copyWith(
          platform: TargetPlatform.iOS,
        ),
        builder: ExtendedNavigator<AppRouter>(
          router: AppRouter(),
          guards: [AuthGuard()],
        ),
      );
    }

    Widget buildAPP(ThemeProvider darkModelProvider) {
      switch (darkModelProvider.darkMode) {
        case 2: //跟随系统
          return buildMaterialApp(
            theme: ThemeData(
              primarySwatch: darkModelProvider.materialColor,
            ),
            darkTheme: ThemeData.dark(),
          );
        case 1: //开启
          return buildMaterialApp(theme: ThemeData.dark());
        case 0: //关闭
        default:
          return buildMaterialApp(
            theme: ThemeData(primarySwatch: darkModelProvider.materialColor),
          );
      }
    }

    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ProfileProvider>(create: (_) => ProfileProvider()),
          //个人资料
          ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
          //主题
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, darkModel, _) {
            return buildAPP(darkModel);
          },
        ));
  }
}
