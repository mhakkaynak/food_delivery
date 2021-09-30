import '../../../../core/init/database/database_manager.dart';
import '../../../../core/init/network/network_manager.dart';
import '../../../authentication/entry/model/user_model.dart';
import 'base_product_service.dart';

class ProductService implements IProductService {
  ProductService._init() {
    _init();
  }

  static ProductService _instance;

  String _userId;

  @override
  Future<void> addCart(String foodId) async {
    await _fetch('/user/cart/update/add/$_userId/$foodId');
  }

  @override
  Future<bool> likeFood(String foodId) async {
    final response =
        await _fetch('/user/favorite-foods/update/$_userId/$foodId');
    return response['wasItLiked'];
  }

  @override
  Future<bool> wasItLiked(String foodId) async {
    final response =
        await _fetch('/user/favorite-foods/wasItLiked/$_userId/$foodId');

    return response['wasItLiked'];
  }

  Future<void> _init() async {
    _userId =
        (await DbManager.instance.fetchUser(UserModel.empty()) as UserModel).id;
  }

  static ProductService get instance {
    _instance ??= ProductService._init();
    return _instance;
  }

  Future<dynamic> _fetch(String path) async =>
      await NetworkManager.instance.fetch(path);
}
