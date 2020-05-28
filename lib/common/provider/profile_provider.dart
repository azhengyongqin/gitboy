import 'package:flutter/material.dart';
import '../../global.dart';
import '../entity/entity.dart';
import '../utils/utils.dart';
import '../values/values.dart';

class ProfileProvider with ChangeNotifier {
  UserProfile profile;

  UserProfile get userProfile => profile;

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
      this.profile = UserProfile.fromJson(_profileJSON);
      print('离线用户数据：$profile');
      notifyListeners();
      Global.profile = profile;
    }
  }

  saveUser(UserProfile value) async {
    profile = value;
    notifyListeners();

    if (value == null) {
      await StorageUtil().remove(STORAGE_USER_PROFILE_KEY);
      return;
    }
    //持久化
    await StorageUtil().setJSON(STORAGE_USER_PROFILE_KEY, profile.toJson());
  }
}
