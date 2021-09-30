
abstract class IProductService {
  Future<void> addCart(String foodId);

  Future<bool> likeFood(String foodId);

  Future<bool> wasItLiked(String foodId);
}