import 'package:food_delivery/core/constants/enum/food_types_enum.dart';

extension FoodTypesExtension on FoodTypes {
  String get rawValue {
    switch (this) {
      case FoodTypes.MAIN_COURSES:
        return 'Main Course';
      case FoodTypes.DRINKS:
        return 'Drink';
      case FoodTypes.SNACKS:
        return 'Snack';
      case FoodTypes.SAUCE:
        return 'Sauce';
      default:
        return 'Food';
    }
  }
}
