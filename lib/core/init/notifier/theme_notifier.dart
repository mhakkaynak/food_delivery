import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants/enum/app_theme_enum.dart';
import '../theme/app_theme_ligth.dart';

class ThemeNotifier extends ChangeNotifier {
  static ThemeNotifier _instance;
  static ThemeNotifier get instance {
    _instance ??= ThemeNotifier._init();
    return _instance;
  }

  ThemeData _currentTheme = AppThemeLight.instance.ligthTheme;
  ThemeData get currentTheme => _currentTheme;

  ThemeNotifier._init();

  void changeTheme(AppThemes theme) {
    switch (theme) {
      case AppThemes.LIGTH:
        _currentTheme = AppThemeLight.instance.ligthTheme;
        break;
      case AppThemes.DARK:
        _currentTheme = ThemeData.dark();
        break;
      default:
        _currentTheme = AppThemeLight.instance.ligthTheme;
        break;
    }
    notifyListeners();
  }
}
