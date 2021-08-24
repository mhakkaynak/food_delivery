import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/core/init/database/database_manager.dart';
import 'package:food_delivery/core/init/network/network_manager.dart';
import 'package:food_delivery/view/home/_model/food_model.dart';


part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductState(index: 0));

  void changeIndex(int index) {
    emit(ProductState(index: index));
  }

  Future<void> likeFood(String id) async {
    await NetworkManager.instance
        .fetch('/food/like-counter/$id?increment=true', FoodModel.empty());
  }
}
