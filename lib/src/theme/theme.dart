import 'package:flutter/material.dart';



class ThemeChanger extends ChangeNotifier {

  bool  _darkMode    = false;
  bool  _customTheme = false;

  bool get darkMode => _darkMode;
  bool get customTheme => _customTheme;

  set darkMode ( bool value){
    _customTheme = false;
    _darkMode = value;
    notifyListeners();
  }

  set customTheme ( bool value){
    _darkMode = false;
    _customTheme = value;
    notifyListeners();
  }

}