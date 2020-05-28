import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gitboy/common/entity/entity.dart';
import 'package:gitboy/common/provider/profile_provider.dart';
import 'package:gitboy/common/utils/utils.dart';
import 'package:gitboy/global.dart';
import 'package:provider/provider.dart';

/// 用户
class UserAPI {
  /// 登录
  static Future<UserProfile> login({
    @required BuildContext context,
    LoginReq params,
  }) async {
    var response = await HttpUtil().post(
      '/oauth/token',
      context: context,
      params: FormData.fromMap(params.toJson()),
      options: Options(
        contentType: 'application/x-www-form-urlencoded',
      ),
    );
    var loginResp = LoginResp.fromJson(response);
    if (loginResp.accessToken.isEmpty) {
      return null;
    }

    var response2 = await HttpUtil().get('/api/v5/user', context: context, params: {
      'access_token': loginResp.accessToken,
    });
    var userResp = UserResp.fromJson(response2);

    UserProfile userProfile = new UserProfile();
    userProfile.user = userResp;
    userProfile.loginReq = params;
    userProfile.loginResp = loginResp;

    Provider.of<ProfileProvider>(context, listen: false).saveUser(userProfile);
//    Global.saveProfile(userProfile);
    return userProfile;
  }
}
