import 'package:flutter/material.dart';
import 'package:food_delivery/view/home/_model/food_model.dart';

import 'base_navigation_manager.dart';

class NavigationManager implements BaseNavigationMAnager {
  static NavigationManager _instance;
  static NavigationManager get instance {
    _instance ??= NavigationManager._init();
    return _instance;
  }

  final GlobalKey<NavigatorState> navigationKey = GlobalKey();
  final _removeOldPage = (Route<dynamic> route) => false;

  NavigationManager._init();

  @override
  Future<void> naigationTopPageClear(String path, {Object args}) async {
    await navigationKey.currentState
        .pushNamedAndRemoveUntil(path, _removeOldPage, arguments: args);
  }

  @override
  Future<void> navigationToPage(String path, {Object args}) async {
    await navigationKey.currentState.pushNamed(path, arguments: args);
  }

  @override
  void navigationPop() {
    navigationKey.currentState.pop();
  }
}
