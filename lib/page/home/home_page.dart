import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitboy/common/utils/utils.dart';
import 'package:gitboy/router/router.gr.dart';

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
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
          ),
          title: TabBar(
            isScrollable: true,
            indicatorWeight: duSetHeight(2),
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
            tabs: <Widget>[
              Tab(text: '推荐'),
              Tab(text: '热门'),
              Tab(text: '最近更新'),
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
          child: ListView(
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
                        CircleAvatar(
                          radius: 36,
                          backgroundImage: AssetImage('assets/images/avatar.png'),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: Icon(Icons.mode_edit,color: theme.primaryTextTheme.headline6.color),
                          onPressed: () {},
                        )
                      ],
                    ),
                    SizedBox(height: duSetHeight(8)),
                    Text(
                      'azhengliang',
                      style:theme.primaryTextTheme.headline6,
                    ),
                    SizedBox(height: duSetHeight(4)),
                    Text(
                      '暂无简介,theme.primaryTextTheme.暂无简介,theme.primaryTextTheme.暂无简介,theme.primaryTextTheme.',
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
