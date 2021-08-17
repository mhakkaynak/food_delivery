import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/view/home/model/food_model.dart';
import 'package:food_delivery/view/home/model/food_types_model.dart';
import 'package:food_delivery/view/home/service/food_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(HomeState(
          tabBarIndex: 0,
          foodList: [],
        )) {
    _getFoods();
  }

  void changeTabBarIndex(int index) {
    _getFoods(index: index);
    emit(HomeState(tabBarIndex: index));
  }

  Future<void> getFoodsInSearchResult(String keyword) async {
    emit(HomeState(
        foodList: await FoodService.instance.getFoodsInSearchResult(keyword)));
  }

  Future<void> _getFoods({int index}) async {
    emit(HomeState(
        foodList: await FoodService.instance
            .getFoods(FoodTypesModel.instance.foodTypesList[index ?? 0])));
  }
}
