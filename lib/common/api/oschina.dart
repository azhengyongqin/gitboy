import 'package:flutter/material.dart';
import 'package:gitboy/common/entity/oschina/oschina.dart';
import 'package:gitboy/common/utils/http.dart';

const private_token = 'hFhLzQzP3GB2mTYsWViE';

class OschinaAPI {
  static Future<List<OschinaProject>> oschinaList({
    @required BuildContext context,
    @required String query,
    int page = 1,
  }) async {
    var resp = await HttpUtil().get(
      'http://git.oschina.net/api/v3/projects/$query',
      context: context,
      params: {'page': page, 'private_token': private_token},
    );

    return resp.map<OschinaProject>((m) => OschinaProject.fromJson(m)).toList();
  }
}
