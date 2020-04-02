import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_demo/common/common.dart';
import 'package:theme_demo/provider/app_info.dart';
import 'package:theme_demo/utils/sp_helper.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  
  String _colorKey;

  @override
  void initState() {
    super.initState();

    _initAsync();
  }

  _initAsync() async {
    setState(() {
      _colorKey = SpHelper.getString(Constant.key_theme_color, defValue: 'blue');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('设置'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            leading: Icon(Icons.color_lens),
            title: Text('主题'),
            initiallyExpanded: true,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: themeColorMap.keys.map((key) {
                      Color value = themeColorMap[key];
                      return InkWell(
                        onTap: () {
                          setState(() {
                           _colorKey = key; 
                          });
                          SpHelper.putString(Constant.key_theme_color, key);
                          Provider.of<AppInfoProvider>(context, listen: false).setTheme(key);
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          color: value,
                          child: _colorKey == key ? Icon(Icons.done, color: Colors.white,) : null,
                        ),
                      );
                    }).toList(),
                  ),
              )
            ],
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('多语言'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('跟随系统', style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                )),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
          )
        ],
      ),
    );
  }
}