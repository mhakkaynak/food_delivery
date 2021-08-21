import 'package:flutter/material.dart';
import 'package:food_delivery/view/home/home/view/subview/search_view.dart';
import '../../../view/home/home/view/home_view.dart';
import '../../../view/home/order/view/order_view.dart';
import '../../../view/errors/view/error_view.dart';
import '../../../view/authentication/entry/view/entry_view.dart';
import '../../../view/authentication/spalsh/view/spalsh_view.dart';
import '../../constants/navigation/navigation_constant.dart';

class NavigationRouteManager {
  NavigationRouteManager._init();

  static NavigationRouteManager _instance;

  static NavigationRouteManager get instance {
    _instance ??= NavigationRouteManager._init();
    return _instance;
  }

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstant.SPLASH:
        return _navigationToDefault(SpalshView(), args);
        break;
      case NavigationConstant.LOGIN:
        return _navigationToDefault(EntryView(), args);
      case NavigationConstant.ERROR:
        return _navigationToDefault(ErrorView(), args);
      case NavigationConstant.HOME:
        return _navigationToDefault(HomeView(), args);
      case NavigationConstant.ORDER:
        return _navigationToDefault(OrderView(), args);
      case NavigationConstant.SEARCH:
        return _navigationToDefault(SearchView(), args);
      default:
        return _navigationToDefault(ErrorView(), args);
    }
  }

  MaterialPageRoute _navigationToDefault(Widget page, RouteSettings args) =>
      MaterialPageRoute(builder: (context) => page, settings: args);
}
