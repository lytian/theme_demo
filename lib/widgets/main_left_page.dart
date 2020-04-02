import 'package:flutter/material.dart';
import 'package:theme_demo/pages/setting_page.dart';

class MainLeftPage extends StatefulWidget {
  @override
  _MainLeftPageState createState() => _MainLeftPageState();
}

class _MainLeftPageState extends State<MainLeftPage> {

  List<_ListItemInfo> _items = <_ListItemInfo>[
    new _ListItemInfo('download', '下载记录', Icons.file_download),
    new _ListItemInfo('collection', '我的收藏', Icons.collections),
    new _ListItemInfo('setting', '设置', Icons.settings),
    new _ListItemInfo('about', '关于', Icons.info),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
          accountName: Text('单身汪', style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          accountEmail: Text('别看了，臭屌丝。有本事充钱啊！',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white
            ),
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _items.length ,
            itemBuilder: (BuildContext context, int index) {
                _ListItemInfo item = _items[index];
                return ListTile(
                  leading: Icon(item.icon),
                  title: Text(item.title),
                  onTap: () {
                    switch (item.id) {
                      case 'download':
                        Navigator.pop(context); // 先关闭Drawer
                        // 再跳转页面
                        break;
                      case 'setting':
                        Navigator.pop(context); // 先关闭Drawer
                        // 再跳转页面
                        Navigator.push(
                          context,
                          new MaterialPageRoute(builder: (context) => new SettingPage()),
                        );
                        break;
                      case 'about':
                        Navigator.pop(context); // 先关闭Drawer
                        // 再跳转页面
                        break;
                      default:
                    }
                  }
                );
            }),
        ),
      ],
    );
  }
}

class _ListItemInfo {
  final String id;
  final String title;
  final IconData icon;
  final Widget page;
  final bool withScaffold;

  _ListItemInfo(this.id, this.title, this.icon, [this.page, this.withScaffold = true]);
}