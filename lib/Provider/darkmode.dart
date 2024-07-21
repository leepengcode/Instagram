import 'package:flutter/material.dart';

class themeModeProvider with ChangeNotifier {
  var _themeMode = ThemeMode.light;
  get themeMode => _themeMode;

  void setTheme(themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
