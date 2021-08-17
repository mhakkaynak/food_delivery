import 'package:food_delivery/view/home/model/food_model.dart';

abstract class IFoodService {
  Future<List<FoodModel>> getFoods(String foodType, {String sortBy});

  Future<List<FoodModel>> getFoodsInSearchResult(String keyword);

  Future<void> likeTheFood(String id, bool isItLiked);
}
