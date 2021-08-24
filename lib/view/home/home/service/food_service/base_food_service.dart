import '../../../_model/food_model.dart';

abstract class IFoodService {
  Future<List<FoodModel>> getFoods(String foodType, {String sortBy});

  Future<List<FoodModel>> getFoodsInSearchResult(String keyword);
}
