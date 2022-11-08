import 'package:flutter/material.dart';



class ThemeChanger extends ChangeNotifier {

  bool  _darkMode    = false;
  bool  _customTheme = false;

  late ThemeData _currentTheme;

  ThemeChanger ( int value ){

    switch (value) {
      case 1: //light theme
        _darkMode     = false;
        _customTheme  = false;
        _currentTheme = ThemeData.light();

        break;
      
      case 2: //Dark theme
        _darkMode     = true;
        _customTheme  = false;
        _currentTheme = ThemeData.dark().copyWith(
          colorScheme: ColorScheme.dark(
            secondary: Colors.pink,
          )
        );

        break;

      case 3: //Custom theme
        _darkMode     = false;
        _customTheme  = true;
        _currentTheme = ThemeData.light().copyWith(
        drawerTheme: DrawerThemeData(
          backgroundColor: Color(0XFF16202B)
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.white
          )
        ),
        scaffoldBackgroundColor: Color(0XFF16202B),
        colorScheme: ColorScheme.light(
          secondary: Color(0xFF48A0EB),
        )
      );
        
        break;

      default:
      _darkMode     = false;
      _customTheme  = false;
      _currentTheme = ThemeData.light();
    }
  }

  bool get darkMode => _darkMode;
  bool get customTheme => _customTheme;
  ThemeData get currentTheme => _currentTheme;

  set darkMode ( bool value){
    _customTheme = false;
    _darkMode = value;

    if( value ){
      _currentTheme = ThemeData.dark().copyWith(
          colorScheme: ColorScheme.dark(
            secondary: Colors.pink,
          )
        );
    }else{
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }

  set customTheme ( bool value){
    _darkMode = false;
    _customTheme = value;

    if( value ){
      _currentTheme = ThemeData.light().copyWith(
        drawerTheme: DrawerThemeData(
          backgroundColor: Color(0XFF16202B)
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.white
          )
        ),
        scaffoldBackgroundColor: Color(0XFF16202B),
        colorScheme: ColorScheme.light(
          secondary: Color(0xFF48A0EB),
        )
      );
    }else{
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }
}