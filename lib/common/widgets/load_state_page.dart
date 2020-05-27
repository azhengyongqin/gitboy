import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/screen.dart';

enum LoadState {
  Loading, //加载中
  Success, //成功
  Error, //错误
  Empty, //空数据
}

class LoadStatePage extends StatefulWidget {
  final LoadState state; //页面状态
  final Widget successWidget; //成功视图
  final String errorMsg; //错误消息
  final VoidCallback onError; //错误事件处理
  final VoidCallback onEmpty; //空数据

  LoadStatePage({
    Key key,
    this.state,
    this.successWidget,
    this.errorMsg,
    this.onError,
    this.onEmpty,
  }) : super(key: key); //空数据事件处理

  @override
  _LoadStatePageState createState() => _LoadStatePageState();
}

class _LoadStatePageState extends State<LoadStatePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //宽高都充满屏幕剩余空间
      width: double.infinity,
      height: double.infinity,
      child: this._buildChild(),
    );
  }

  Widget _buildChild() {
    switch (this.widget.state) {
      case LoadState.Loading:
        return _buildLoading();

      case LoadState.Success:
        return this.widget.successWidget;

      case LoadState.Error:
        return this._buildError();

      case LoadState.Empty:
        return this._buildEmpty();
      default:
        return null;
    }
  }

  /// 构建加载中状态页面
  Widget _buildLoading() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoActivityIndicator(
              radius: 20,
            ),
            SizedBox(height: duSetHeight(14)),
            Text(
              '拼命加载中...',
              style: TextStyle(
                  color: Color(0x6658575b), fontSize: duSetHeight(16)),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建加载中状态页面
  Widget _buildError() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        child: InkWell(
          onTap: this.widget.onError,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/svg/not_net.svg',
                width: duSetWidth(100),
                height: duSetHeight(100),
                color: Color(0x6658575b),
              ),
              SizedBox(height: duSetHeight(14)),
              Text(
                this.widget.errorMsg == null
                    ? '加载失败，请轻触重试~'
                    : this.widget.errorMsg,
                style: TextStyle(
                  color: Color(0x6658575b),
                  fontSize: duSetHeight(16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 构建空数据状态页面
  Widget _buildEmpty() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        child: InkWell(
          onTap: this.widget.onEmpty,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/svg/empty_state.svg',
                width: duSetWidth(100),
                height: duSetHeight(100),
                color: Color(0x6658575b),
              ),
              SizedBox(height: duSetHeight(14)),
              Text(
                '暂无相关数据,轻触重试~',
                style: TextStyle(
                  color: Color(0x6658575b),
                  fontSize: duSetHeight(16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
