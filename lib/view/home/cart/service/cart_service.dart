import '../../../../core/init/database/database_manager.dart';
import '../../../../core/init/network/network_manager.dart';
import '../../../authentication/entry/model/user_model.dart';
import '../model/cart_model.dart';
import 'base_cart_service.dart';

class CartService extends ICartService {
  CartService._init() {
    _init();
  }

  static CartService _instance;

  String _userId;

  @override
  Future<void> decreaseProductInCart(String foodId) async {
    await NetworkManager.instance
        .fetch('/user/cart/update/decrease/$_userId/$foodId');
  }

  @override
  Future<List<CartModel>> getCart() async {
    final products = await NetworkManager.instance.fetch(
        '/user/cart/get/60f330b9cd5a915004cffa60',
        model: CartModel.empty()) as List<CartModel>;
    return products;
  }

  @override
  Future<void> increaseProductInCart(String foodId) async {
    await NetworkManager.instance
        .fetch('/user/cart/update/add/$_userId/$foodId');
  }

  @override
  Future<String> likeFood(String foodId) async {
    if (await _wasItLiked(foodId)) {
      return 'This food has already been liked';
    } else {
      await NetworkManager.instance
          .fetch('/user/favorite-foods/update/$_userId/$foodId');
      return null;
    }
  }

  @override
  Future<void> removeFromCart(String foodId) async {
    await NetworkManager.instance
        .fetch('/user/cart/update/remove/$_userId/$foodId');
  }

  static CartService get instance {
    _instance ??= CartService._init();
    return _instance;
  }

  Future<void> _init() async {
    final user =
        await DbManager.instance.fetchUser(UserModel.empty()) as UserModel;
    _userId = user.id;
  }

  Future<bool> _wasItLiked(String foodId) async {
    final response = await NetworkManager.instance
        .fetch('/user/favorite-foods/wasItLiked/$_userId/$foodId');
    return response['wasItLiked'];
  }
}
