import 'package:food_delivery/core/init/network/network_manager.dart';
import 'package:food_delivery/view/home/model/food_model.dart';
import 'package:food_delivery/view/home/service/base_food_service.dart';

class FoodService implements IFoodService {
  FoodService._init();

  static FoodService _instance;

  final _foodUrl = '/food';

  @override
  Future<List<FoodModel>> getFoods(String foodType, String sortBy) async {
    final List<FoodModel> foodList = await NetworkManager.instance
        .fetch<FoodModel>(
            '$_foodUrl/food-list/$foodType?sortBy=$sortBy', FoodModel.empty());
    return foodList;
  }

  @override
  Future<void> likeTheFood(String id, bool isItLiked) async {
    await NetworkManager.instance.fetch<FoodModel>(
        // TODO: will be change
        '/food/food-list/snacks?sortBy=name&sortType=ascending',
        FoodModel.empty());
  }

  static FoodService get instance {
    _instance ??= FoodService._init();
    return _instance;
  }
}
