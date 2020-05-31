import 'package:auto_route/auto_route.dart';
import 'package:gitboy/common/entity/entity.dart';
import 'package:gitboy/common/utils/utils.dart';
import 'package:gitboy/common/values/values.dart';
import 'package:gitboy/router/router.gr.dart';

class AuthGuard extends RouteGuard {
  @override
  Future<bool> canNavigate(ExtendedNavigatorState navigator, String routeName, Object arguments) async {
    var _profileJSON = await StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
    print('本地数据：$_profileJSON');
    if (_profileJSON != null) {
      var profile = UserProfile.fromJson(_profileJSON);
      if (profile.user.login != null) {
        return true;
      }
    }
    ExtendedNavigator.ofRouter<AppRouter>().pushLoginPage();
    return routeName == Routes.homePage;
  }
}
