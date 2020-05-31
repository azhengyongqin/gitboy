import 'package:flutter/material.dart';
import 'package:gitboy/common/fonts/iconfont.dart';
import 'package:gitboy/common/utils/utils.dart';
import 'package:gitboy/common/values/values.dart';

import 'avatar.dart';

class RepositoryListItem extends StatelessWidget {
  const RepositoryListItem({
    Key key,
    this.avatarSrc,
    this.ownerName,
    this.language='未设置',
    this.name,
    this.description,
    this.starsCount=0,
    this.forksCount=0,
    this.watchesCount=0,
    this.onItemTap,
    this.onUserTap,
  }) : super(key: key);

  final String avatarSrc; //头像地址
  final String ownerName; //用户名
  final String language; //仓库代码语言
  final String name; //仓库名字
  final String description; //仓库描述
  final int starsCount;
  final int forksCount;
  final int watchesCount;
  final VoidCallback onItemTap;
  final VoidCallback onUserTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onItemTap,
      dense: true,
      isThreeLine: true,
      title: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              InkWell(
                onTap: onUserTap,
                child: Row(
                  children: <Widget>[
                    Avatar(
                      radius: 24,
                      borderRadius: 24,
                      src: avatarSrc,
                    ),
                    SizedBox(width: duSetWidth(6)),
                    Text(
                      ownerName,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: duSetFontSize(14),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Text(
                language,
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
                  color: GitLanguage[language.toLowerCase()],
                ),
              ),
            ],
          ),
          SizedBox(height: duSetHeight(8)),
          Row(children: <Widget>[
            Expanded(
              child: Text(
                name,
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
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: duSetHeight(16)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.stars, size: duSetFontSize(14), color: Colors.amber),
              SizedBox(width: duSetHeight(4)),
              Text('$starsCount'),
              SizedBox(width: duSetHeight(16)),
              Icon(IconFont.icon_fork, size: duSetFontSize(14), color: Theme.of(context).textTheme.caption.color),
              SizedBox(width: duSetHeight(4)),
              Text('$forksCount'),
              SizedBox(width: duSetHeight(16)),
              Icon(Icons.visibility, size: duSetFontSize(14), color: Theme.of(context).textTheme.caption.color),
              SizedBox(width: duSetHeight(4)),
              Text('$watchesCount'),
            ],
          )
        ],
      ),
    );
  }
}
