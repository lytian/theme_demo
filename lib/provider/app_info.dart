import 'package:flutter/material.dart';

class AppInfoProvider with ChangeNotifier {
  // 这里最好要分开写
  String _themeColor = '';

  String get themeColor => _themeColor;

  void setTheme(String themeColor) {
    _themeColor = themeColor;
    notifyListeners();
  }
}