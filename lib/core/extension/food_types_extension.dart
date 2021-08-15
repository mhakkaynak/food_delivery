import 'package:food_delivery/core/constants/enum/food_types_enum.dart';

extension FoodTypesExtension on FoodTypes {
  String get rawValue {
    switch (this) {
      case FoodTypes.MAIN_COURSES:
        return 'Main Courses';
      case FoodTypes.DRINKS:
        return 'Drinks';
      case FoodTypes.SNACKS:
        return 'Snacks';
      case FoodTypes.SAUCE:
        return 'Sauce';
      default:
        return 'Food';
    }
  }
}
