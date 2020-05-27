import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gitboy/common/font/iconfont.dart';
import 'package:gitboy/common/utils/screen.dart';
import 'package:gitboy/common/widgets/logo.dart';
import 'package:gitboy/router/router.dart';
import 'package:gitboy/router/router.gr.dart';
import 'package:google_fonts/google_fonts.dart';

import './signup.dart';
import '../../common/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// email的控制器
  final TextEditingController _accountController = TextEditingController();

  /// 密码的控制器
  final TextEditingController _passController = TextEditingController();

  /// 是否显示清除按钮
  bool _showClear = false;

  /// 是否显示秘密啊
  bool _showPassword = true;

  @override
  void initState() {
    _accountController.addListener(() {
      this._showClear = _accountController.text.length > 0;
      setState(() {});
    });

    super.initState();
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  // 登录表单
  Widget _buildInputForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: duSetHeight(32),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Icon(Icons.mail,color: Theme.of(context).primaryColor,size: duSetFontSize(32),),
                SizedBox(width: duSetWidth(18)),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _accountController,
                    decoration: InputDecoration(
                      hintText: "邮箱",
                      suffixIcon: _showClear
                          ? IconButton(
                              icon: Icon(Icons.cancel),
                              onPressed: () {
                                setState(() {
                                  this._accountController.clear();
                                });
                              },
                            )
                          : null,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return '账号不能为空！';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: duSetHeight(16),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Icon(Icons.lock, color: Theme.of(context).primaryColor,size: duSetFontSize(32),),
                SizedBox(width: duSetWidth(18)),
                Expanded(
                  child: TextFormField(
                    controller: _passController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        hintText: "密码",
                        suffixIcon: _showPassword
                            ? IconButton(
                                icon: Icon(Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    this._showPassword = !this._showPassword;
                                  });
                                },
                              )
                            : IconButton(
                                icon: Icon(Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    this._showPassword = !this._showPassword;
                                  });
                                },
                              )),
                    obscureText: _showPassword,
                    validator: (value) {
                      if (value.isEmpty) {
                        return '密码不能为空！';
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: duSetHeight(48),
            ),
            btnFlatButtonWidget(
              context: context,
              title: '登\t录',
              onPressed: () {
                ExtendedNavigator.ofRouter<AppRouter>().pushHomePage();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
              child: Container(
            width: double.infinity,
            height: duSetHeight(350),
            child: BezierContainer(),
          )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: duSetHeight(100)),
                  Logo(),
                  SizedBox(height: 60),
                  _buildInputForm(),
                ],
              ),
            ),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ));
  }
}
