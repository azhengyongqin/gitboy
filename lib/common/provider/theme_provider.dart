import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  /// 夜间模式 0: 关闭 1: 开启 2: 随系统
  int _darkMode;
  MaterialColor _materialColor;

  static const Map<int, String> darkModeMap = {0: "关闭", 1: "开启", 2: "跟随系统"};
  static const String DARK_MODE_KEY = 'darkMode';
  static const String COLOR_KEY = 'color_key';

  SharedPreferences _sp;

  int get darkMode => _darkMode;

  MaterialColor get materialColor => _materialColor;

  ThemeProvider() {
    _init();
  }

  void _init() async {
    print('初始化主题');
    this._sp = await SharedPreferences.getInstance();

    /// 初始化主题黑夜模式
    int localMode = this._sp.getInt(DARK_MODE_KEY);
    switchMode(localMode ?? 2);

    /// 初始化主题颜色
    int localColor = this._sp.getInt(COLOR_KEY);
    if (localColor == null) {
      _materialColor = Colors.teal;
    } else {
      switchTeme(Colors.primaries[localColor]);
    }
  }

  /// 切换黑夜主题模式
  void switchMode(int darkMode) async {
    _darkMode = darkMode;
    notifyListeners();
    SharedPreferences prefs = this._sp ?? SharedPreferences.getInstance();
    await prefs.setInt(DARK_MODE_KEY, darkMode);
  }
  
  /// 切换主题颜色
  void switchTeme(MaterialColor color) async {
    _materialColor = color;
    notifyListeners();
    SharedPreferences sp = this._sp ?? SharedPreferences.getInstance();
    await sp.setInt(COLOR_KEY, Colors.primaries.indexOf(_materialColor));
  }
}
