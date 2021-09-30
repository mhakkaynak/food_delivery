import 'package:flutter/material.dart';
import 'package:food_delivery/view/home/payment/view/payment_view.dart';

import '../../../view/authentication/entry/view/entry_view.dart';
import '../../../view/authentication/spalsh/view/spalsh_view.dart';
import '../../../view/errors/view/error_view.dart';
import '../../../view/home/cart/view/cart_view.dart';
import '../../../view/home/home/view/home_view.dart';
import '../../../view/home/home/view/subview/search_view.dart';
import '../../../view/home/product/view/product_view.dart';
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
      case NavigationConstant.SEARCH:
        return _navigationToDefault(SearchView(), args);
      case NavigationConstant.PRODUCT:
        return _navigationToDefault(ProductView(), args);
      case NavigationConstant.CART:
        return _navigationToDefault(CartView(), args);
      case NavigationConstant.PAYMENT:
        return _navigationToDefault(PaymentView(), args);
      default:
        return _navigationToDefault(ErrorView(), args);
    }
  }

  MaterialPageRoute _navigationToDefault(Widget page, RouteSettings args) =>
      MaterialPageRoute(builder: (context) => page, settings: args);
}
