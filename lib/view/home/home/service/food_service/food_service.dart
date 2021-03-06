
import '../../../../../core/init/network/network_manager.dart';
import '../../../_model/food_model.dart';
import 'base_food_service.dart';

class FoodService implements IFoodService {
  FoodService._init();

  static FoodService _instance;

  final _foodUrl = '/food';

  @override
  Future<List<FoodModel>> getFoods(String foodType, {String sortBy}) async =>
      _getFoodList('$_foodUrl/food-list/$foodType?sortBy=${sortBy ?? 'name'}');

  @override
  Future<List<FoodModel>> getFoodsInSearchResult(String keyword) async =>
      await _getFoodList('$_foodUrl/search-food/$keyword');


  Future<List<FoodModel>> _getFoodList(String path) async =>
      await NetworkManager.instance.fetch(path,model: FoodModel.empty());

  static FoodService get instance {
    _instance ??= FoodService._init();
    return _instance;
  }
}
