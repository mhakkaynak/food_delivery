import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/constants/navigation/navigation_constant.dart';
import '../../../../core/init/navigation/navigation_manager.dart';
import '../service/product_service.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({this.foodId}) : super(ProductState(wasItLiked: false)) {
    _init();
  }

  final String foodId;

  Future<void> _init() async {
    final wasItLiked = await ProductService.instance.wasItLiked(foodId);
    emit(ProductState(wasItLiked: wasItLiked));
  }

  Future<void> addCart() async {
   await ProductService.instance.addCart(foodId);
    _goToCartView();
  }

  Future<void> likeFood() async {
    final wasItLiked = await ProductService.instance.likeFood(foodId);
    emit(ProductState(wasItLiked: wasItLiked));
  }

  void _goToCartView() {
    NavigationManager.instance
        .navigationToPage(NavigationConstant.CART);
  }
}
