part of 'home_cubit.dart';

class HomeState extends Equatable {
  HomeState({this.foodList, this.tabBarIndex});

  final int tabBarIndex;
  final List<FoodModel> foodList;

  @override
  List<Object> get props => [this.tabBarIndex, this.foodList];
}
