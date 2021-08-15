import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(tabBarIndex: 0));

  void changeTabBarIndex(int index) =>
      emit(HomeState(tabBarIndex: index)); // TODO: burasi bu sekilde bitmeyecek
}
