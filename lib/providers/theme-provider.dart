import 'package:flutter/material.dart';
import 'package:todo_app_v2/common/theme.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isSelected = false;
  bool get isSelected => _isSelected;

  ThemeData _themeData = lightmode;
  ThemeData get themeData => _themeData;

  void toggledTheme() {
    _themeData == lightmode ? _themeData = darkmode : _themeData = lightmode;
    _isSelected =! _isSelected;
    notifyListeners();
  }
}
