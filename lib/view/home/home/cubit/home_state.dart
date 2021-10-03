part of 'home_cubit.dart';

class HomeState extends Equatable {
  HomeState({this.foodList, this.tabBarIndex});

  final List<FoodModel> foodList;
  final int tabBarIndex;

  @override
  List<Object> get props => [
        foodList,
        tabBarIndex,
      ];
}
