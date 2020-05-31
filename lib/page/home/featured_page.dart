import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:gitboy/common/api/apis.dart';
import 'package:gitboy/common/entity/oschina/oschina.dart';
import 'package:gitboy/common/fonts/iconfont.dart';
import 'package:gitboy/common/utils/screen.dart';
import 'package:gitboy/common/values/git_language.dart';
import 'package:gitboy/common/widgets/widgets.dart';

/// 推荐
// ignore: must_be_immutable
class OschinaPage extends StatefulWidget {
  String query;
  OschinaPage({Key key, @required this.query}) : super(key: key);

  @override
  _OschinaPageState createState() => _OschinaPageState();
}

class _OschinaPageState extends State<OschinaPage> with AutomaticKeepAliveClientMixin {
  List<OschinaProject> oschinaProjects = [];
  int page = 1;
  LoadState _loadState = LoadState.Loading;

  @override
  void initState() {
    setState(() {
      this._loadState = LoadState.Loading;
    });
    this._onLoad();
    super.initState();
  }

  _onLoad({bool onRefresh = false}) async {
    try {
      var resp = await OschinaAPI.oschinaList(context: context, page: page, query: widget.query);
      if (onRefresh) {
        this.oschinaProjects = [];
      }
      this.oschinaProjects.addAll(resp);
      setState(() {
        this._loadState = oschinaProjects.length > 0 ? LoadState.Success : LoadState.Empty;
      });
    } on DioError catch (e) {
      if (e.type != DioErrorType.CANCEL) {
        setState(() {
          this._loadState = LoadState.Error;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return LoadStatePage(
      state: this._loadState,
      onError: _onLoad,
      onEmpty: _onLoad,
      successWidget: Scrollbar(
        child: EasyRefresh.custom(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  OschinaProject data = this.oschinaProjects[index];
                  return Column(children: <Widget>[
                    RepositoryListItem(
                      avatarSrc: data.owner.newPortrait,
                      ownerName: data.owner.name,
                      language: data.language,
                      name: data.name,
                      description: data.description,
                      starsCount: data.starsCount,
                      forksCount: data.forksCount,
                      watchesCount: data.watchesCount,
                    ),
                    Divider(),
                  ]);
                },
                childCount: this.oschinaProjects.length,
              ),
            )
          ],
          onLoad: () async {
            this.page++;
            await _onLoad();
          },
          onRefresh: () async {
            this.page = 1;
            await _onLoad(onRefresh: true);
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class GiteeItem extends StatelessWidget {
  const GiteeItem({
    Key key,
    @required this.data,
  }) : super(key: key);

  final OschinaProject data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      isThreeLine: true,
      title: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Avatar(
                radius: 24,
                borderRadius: 24,
                src: data.owner.newPortrait,
              ),
              SizedBox(width: duSetWidth(6)),
              Text(
                '${data.owner.name}',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: duSetFontSize(14),
                ),
              ),
              Spacer(),
              Text(
                '${'${data.language != null ? data.language.toLowerCase() : '未设置'}'}',
                style: TextStyle(
                  fontSize: duSetFontSize(12),
                ),
              ),
              SizedBox(width: duSetWidth(4)),
              Container(
                width: duSetHeight(10),
                height: duSetHeight(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(duSetHeight(5)),
                  color: GitLanguage['${data.language != null ? data.language.toLowerCase() : '未设置'}'],
                ),
              ),
            ],
          ),
          SizedBox(height: duSetHeight(8)),
          Row(children: <Widget>[
            Expanded(
              child: Text(
                '${data.name}',
                style: TextStyle(fontSize: duSetFontSize(15)),
              ),
            ),
          ]),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            data.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: duSetHeight(16)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.stars, size: duSetFontSize(14), color: Colors.amber),
              SizedBox(width: duSetHeight(4)),
              Text('${data.starsCount}'),
              SizedBox(width: duSetHeight(16)),
              Icon(IconFont.icon_fork, size: duSetFontSize(14), color: Theme.of(context).textTheme.caption.color),
              SizedBox(width: duSetHeight(4)),
              Text('${data.forksCount}'),
              SizedBox(width: duSetHeight(16)),
              Icon(Icons.visibility, size: duSetFontSize(14), color: Theme.of(context).textTheme.caption.color),
              SizedBox(width: duSetHeight(4)),
              Text('${data.watchesCount}'),
            ],
          )
        ],
      ),
    );
  }
}
