import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppThemeLight extends AppTheme {
  AppThemeLight._init();

  static AppThemeLight _instance;

  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance;
  }

  ThemeData get ligthTheme => ThemeData(
    
        appBarTheme: AppBarTheme(
            backgroundColor: _appColorScheme.background,
            elevation: 0,
            iconTheme: IconThemeData(color: _appColorScheme.secondary)),
        colorScheme: _appColorScheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
        ),
        iconTheme: IconThemeData(color: _appColorScheme.secondary),
        inputDecorationTheme: InputDecorationTheme(
            fillColor: _appColorScheme.onBackground,
            filled: true,
            labelStyle: TextStyle(color: _appColorScheme.onSecondary),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32)),
                borderSide: BorderSide(color: _appColorScheme.onBackground))),
        scaffoldBackgroundColor: _appColorScheme.background,
        
        textTheme: TextTheme(
          headline4: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: _appColorScheme.secondary),
          headline5: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          headline6: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: _appColorScheme.primary),
          subtitle1: TextStyle(fontSize: 16, color: _appColorScheme.primary),
          subtitle2: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          bodyText1: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        tabBarTheme: TabBarTheme(
          labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          labelColor: _appColorScheme.secondary,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: _appColorScheme.primary, width: 4),
          ),
        ),
      );

  ColorScheme get _appColorScheme => ColorScheme(
        primary: Color(0xfffa4a0c),
        primaryVariant: Colors.grey,
        secondary: Colors.black,
        secondaryVariant: Color(0xffFA4A0C),
        surface: Color(0xff4a6572),
        background: Color(0xfff2f2f2),
        error: Colors.red,
        onPrimary: Colors.white,
        onSecondary: Colors.white24,
        onSurface: Colors.black54,
        onBackground: Color(0xffefeeee),
        onError: Colors.white,
        brightness: Brightness.light,
      );
}
