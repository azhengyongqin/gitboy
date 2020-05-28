import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitboy/common/provider/profile_provider.dart';
import 'package:gitboy/common/utils/utils.dart';
import 'package:gitboy/router/router.gr.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    // 高度去掉 顶部，底部导航
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: true);
    var theme = Theme.of(context);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: RaisedButton(
            color: Colors.transparent,
            elevation: 0,
            highlightElevation: 0,
            padding: EdgeInsets.all(0),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
            child: Consumer<ProfileProvider>(
              builder: (BuildContext context, ProfileProvider value, Widget child) {
                return ClipOval(
                  child: FadeInImage.assetNetwork(
                    image: value?.userProfile?.user?.avatarUrl ?? '',
                    width: 36,
                    height: 36,
                    fit: BoxFit.cover,
                    placeholder: 'assets/images/avatar.png',
                  ),
                );
              },
            ),
          ),
          title: TabBar(
            labelPadding: EdgeInsets.zero,
            isScrollable: false,
            indicatorWeight: duSetHeight(2),
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: <Widget>[
              Tab(text: '推荐'),
              Tab(text: '热门'),
              Tab(text: '近期'),
              Tab(text: 'Issues'),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            Container(),
            Container(),
            Container(),
            Container(),
          ],
        ),
        drawer: Drawer(
          child: Consumer<ProfileProvider>(
            builder: (BuildContext context, ProfileProvider value, Widget child) {
              return ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            ClipOval(
                              child: FadeInImage.assetNetwork(
                                image: value?.userProfile?.user?.avatarUrl ?? '',
                                width: 72,
                                height: 72,
                                fit: BoxFit.cover,
                                placeholder: 'assets/images/avatar.png',
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: Icon(Icons.mode_edit, color: theme.primaryTextTheme.headline6.color),
                              onPressed: () {},
                            )
                          ],
                        ),
                        SizedBox(height: duSetHeight(8)),
                        Text(
                          value?.userProfile?.user?.login ?? '',
                          style: theme.primaryTextTheme.headline6,
                        ),
                        SizedBox(height: duSetHeight(4)),
                        Text(
                          value?.userProfile?.user?.bio ?? '暂无简介',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: theme.primaryTextTheme.caption,
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.trending_up),
                    title: Text('趋势'),
                  ),
                  ListTile(
                    leading: Icon(Icons.bookmark),
                    title: Text('书签'),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('设置'),
                    onTap: () {
                      ExtendedNavigator.ofRouter<AppRouter>().pushSettingPage();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text('关于'),
                  ),
                  ListTile(
                    leading: Icon(Icons.share),
                    title: Text('分享'),
                  ),
                  ListTile(
                    leading: Icon(Icons.power_settings_new),
                    title: Text('注销'),
                    onTap: (){
                      value.saveUser(null);
                      ExtendedNavigator.ofRouter<AppRouter>().pushLoginPage();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
