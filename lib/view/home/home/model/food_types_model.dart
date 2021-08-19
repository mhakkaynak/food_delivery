import '../../../../core/constants/enum/food_types_enum.dart';
import '../../../../core/extension/food_types_extension.dart';

class FoodTypesModel {
  FoodTypesModel._init();
  static FoodTypesModel  _instance;
  static FoodTypesModel get instance{
    _instance ??= FoodTypesModel._init();
    return _instance;
  }
  final List<String> foodTypesList = [
    FoodTypes.MAIN_COURSES.rawValue,
    FoodTypes.DRINKS.rawValue,
    FoodTypes.SNACKS.rawValue,
    FoodTypes.SAUCE.rawValue
  ];
}
