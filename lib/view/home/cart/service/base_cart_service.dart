import '../model/cart_model.dart';

abstract class ICartService {
  Future<List<CartModel>> getCart();

  Future<String> likeFood(String foodId);

  Future<void> removeFromCart(String foodId);

  Future<void> increaseProductInCart(String foodId);

  Future<void> decreaseProductInCart(String foodId);
}
