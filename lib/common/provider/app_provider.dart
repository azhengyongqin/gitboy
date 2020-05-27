import 'package:flutter/material.dart';

/// 系统相应状态
class AppProvider with ChangeNotifier {
  bool _isGrayFilter;

  get isGrayFilter => _isGrayFilter;

  AppProvider({bool isGrayFilter = false}) {
    this._isGrayFilter = isGrayFilter;
  }

  // 切换灰色滤镜
  switchGrayFilter() {
    _isGrayFilter = !_isGrayFilter;
    notifyListeners();
  }
}
