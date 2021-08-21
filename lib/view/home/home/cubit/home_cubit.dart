import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/constants/navigation/navigation_constant.dart';
import '../../../../core/init/navigation/navigation_manager.dart';
import '../model/food_model.dart';
import '../model/food_types_model.dart';
import '../service/food_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(HomeState(
          tabBarIndex: 0,
          foodList: [],
        )) {
    _getFoods();
  }

  void goToOrderView() {
    NavigationManager.instance.navigationToPage(NavigationConstant.ORDER);
  }

  void changeTabBarIndex(int index) {
    _getFoods(index: index);
    emit(HomeState(tabBarIndex: index));
  }

  Future<void> getFoodsInSearchResult(String keyword) async {
    if (keyword.isNotEmpty) {
      emit(HomeState(
          foodList:
              await FoodService.instance.getFoodsInSearchResult(keyword)));
    }
  }

  void goToBackView() {
    NavigationManager.instance.navigationPop();
    _getFoods(index: 0);
  }

  Future<void> _getFoods({int index}) async {
    emit(HomeState(
        foodList: await FoodService.instance
            .getFoods(FoodTypesModel.instance.foodTypesList[index ?? 0])));
  }

  void goToSearchView() {
    NavigationManager.instance.navigationToPage(NavigationConstant.SEARCH);
  }
}
