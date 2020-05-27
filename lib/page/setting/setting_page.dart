import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitboy/common/provider/providers.dart';
import 'package:gitboy/common/utils/utils.dart';
import 'package:gitboy/router/router.gr.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _scaffoldKey = new GlobalKey<ScaffoldState>();
    ThemeProvider darkModelProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("系统设置"),
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          //黑夜模式
          ExpansionTile(
            leading: Icon(Icons.brightness_low),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("黑夜模式"),
                Text("${ThemeProvider.darkModeMap[darkModelProvider.darkMode]}",
                    style: Theme.of(context).textTheme.caption)
              ],
            ),
            children: <Widget>[
              RadioListTile(
                title: Text("跟随系统"),
                subtitle: Text("随系统设置开启深色模式"),
                value: 2,
                onChanged: (value) {
                  darkModelProvider.switchMode(value);
                },
                groupValue: darkModelProvider.darkMode,
              ),
              RadioListTile(
                title: Text("开启"),
                value: 1,
                onChanged: (value) {
                  darkModelProvider.switchMode(value);
                },
                groupValue: darkModelProvider.darkMode,
              ),
              RadioListTile(
                title: Text("关闭"),
                value: 0,
                onChanged: (value) {
                  darkModelProvider.switchMode(value);
                },
                groupValue: darkModelProvider.darkMode,
              )
            ],
          ),
          //主题色
          ColorThemeWidget(),
          //语言
          ExpansionTile(
            leading: Icon(Icons.language),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("语言"),
                Text("${ThemeProvider.darkModeMap[darkModelProvider.darkMode]}",
                    style: Theme.of(context).textTheme.caption)
              ],
            ),
            children: <Widget>[
              RadioListTile(
                title: Text("跟随系统"),
                value: 2,
                onChanged: (value) {
                },
                groupValue: 1,
              ),
              RadioListTile(
                title: Text("中文"),
                value: 1,
                onChanged: (value) {
                  darkModelProvider.switchMode(value);
                },
                groupValue: 2,
              ),
              RadioListTile(
                title: Text("英语"),
                value: 0,
                onChanged: (value) {
                  darkModelProvider.switchMode(value);
                },
                groupValue: 3,
              )
            ],
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text("清除缓存"),
          ),
        ],
      ),
    );
  }
}

class ColorThemeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> colorsWidgets = Colors.primaries
        .map((color) => InkWell(
              onTap: () {
                Provider.of<ThemeProvider>(context, listen: false).switchTeme(color);
              },
              child: Container(
                decoration: BoxDecoration(color: color, borderRadius: BorderRadius.all(Radius.circular(5))),
                height: duSetWidth(40),
                width: duSetWidth(40),
              ),
            ))
        .toList();
    return ExpansionTile(
      leading: Icon(Icons.color_lens),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("色彩主题"),
          Container(
            decoration: BoxDecoration(
                color: Provider.of<ThemeProvider>(context, listen: false).materialColor,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            height: duSetWidth(20),
            width: duSetWidth(20),
          ),
        ],
      ),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: duSetWidth(20), vertical: duSetHeight(10)),
          child: Wrap(
            spacing: duSetWidth(10),
            runSpacing: duSetHeight(10),
            children: <Widget>[...colorsWidgets],
          ),
        )
      ],
    );
  }
}
