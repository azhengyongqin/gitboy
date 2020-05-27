import 'package:flutter/material.dart';
import 'package:gitboy/common/provider/providers.dart';
import 'package:gitboy/common/utils/utils.dart';
import 'package:provider/provider.dart';

class SettingThemePage extends StatefulWidget {
  @override
  _SettingThemePageState createState() => _SettingThemePageState();
}

class _SettingThemePageState extends State<SettingThemePage> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider darkModelProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("主题设置"),
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[

        ],
      ),
    );
  }
}


