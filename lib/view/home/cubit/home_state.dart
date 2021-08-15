part of 'home_cubit.dart';

class HomeState extends Equatable {
  HomeState({this.tabBarIndex});

  final int tabBarIndex;

  @override
  List<Object> get props => [
        this.tabBarIndex,
      ];
}
