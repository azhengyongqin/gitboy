import 'package:flutter/material.dart';
import '../entity/entity.dart';
import '../utils/utils.dart';
import '../values/values.dart';

class ProfileProvider with ChangeNotifier {
  UserResp _userProfile;

  UserResp get userProfile => _userProfile;

  ProfileProvider() {
    print('初始化个人数据');
    _init();
  }

  void _init() {
    // 读取离线用户信息
    _initUser();
  }

  // 读取离线用户信息
  void _initUser() async {
    var _profileJSON = await StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
    if (_profileJSON != null) {
      this._userProfile = UserResp.fromJson(_profileJSON);
      print('离线用户数据：$_userProfile');
      notifyListeners();
    }
  }

  setUser(UserResp value) async {
    _userProfile = value;
    notifyListeners();

    if (value == null) {
      await StorageUtil().remove(STORAGE_USER_PROFILE_KEY);
      return;
    }
    //持久化
    await StorageUtil().setJSON(STORAGE_USER_PROFILE_KEY, _userProfile.toJson());
  }
}
