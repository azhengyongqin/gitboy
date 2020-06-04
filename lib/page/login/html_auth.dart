import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gitboy/common/api/apis.dart';
import 'package:gitboy/common/values/values.dart';
import 'package:gitboy/router/router.gr.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HtmlAuthPage extends StatefulWidget {
  @override
  _HtmlAuthPageState createState() => _HtmlAuthPageState();
}

class _HtmlAuthPageState extends State<HtmlAuthPage> {
  WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var flag = true;
    return Scaffold(
      appBar: AppBar(
        title: Text('Github认证'),
      ),
      body: WebView(
        initialUrl:
            'http://azhengyongqin_363.gitee.io/gitboy?time=${DateTime.now().millisecond}',
        onWebViewCreated: (WebViewController controller) {
          //页面加载的时候可以获取到controller可以用来reload等操作
          _webViewController = controller;
        },
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: <JavascriptChannel>[
          _toasterJavascriptChannel(context),
        ].toSet(),
        onPageStarted: (String url) {
          print('开始加载：===================');
        },
        onPageFinished: (String url) {
          print('加载完成：===================');
          if (url.contains("code=")) {
            var code = url.substring(url.indexOf("code=") + 5);
            print('$code');
            if (flag) {
              ExtendedNavigator.ofRouter<AppRouter>().pop(code);
            }
            flag = false;
            return null;
          }
//          _webViewController.evaluateJavascript(
//            'oAuth("${Github.OAuthUrl + '/authorize'}","${Github.Client_id}","${Github.Client_secret}","${Github.Scope}")',
//          );
        },
        //拦截页面url
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith('alipays:') ||
              request.url.startsWith('weixin:')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}

// 定义方法
JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
  return JavascriptChannel(
    name: 'Toaster',
    onMessageReceived: (JavascriptMessage message) {
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text(message.message)),
      );
    },
  );
}
