import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/search_bar/search_bar.dart';
import '../../../../core/components/tab_bar/custom_tab_bar.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../product/widgets/card/product_card.dart';
import '../cubit/home_cubit.dart';
import '../model/food_types_model.dart';

// TODO:  onTap for product card
class HomeView extends StatelessWidget {
  HomeView({Key key}) : super(key: key);

  final _searchTextController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    _searchTextController.clear();
    HomeCubit();
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar,
      body: GestureDetector(
        onTap: _exitSearchBar,
        child: Padding(
          padding: context.paddingLowSymetric,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Delicious\nfood for you',
                style: context.currentTheme.textTheme.headline4,
              ),
              Spacer(),
              Expanded(
                flex: 32,
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) =>
                      _buildColumnInsideTheBlocBuilder(context, state),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Column _buildColumnInsideTheBlocBuilder(
          BuildContext context, HomeState state) =>
      Column(
        children: [
          Expanded(
            flex: 3,
            child: _buildSearchBar(context),
          ),
          Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 2,
            child: _buildCustomTabBar(context),
          ),
          Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 16,
            child: _buildProductCardFromListView(state),
          ),
          Spacer(
            flex: 4,
          )
        ],
      );

  AppBar get _buildAppBar => AppBar(actions: [
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return IconButton(
              onPressed: context.read<HomeCubit>().goToOrderView,
              icon: (Icon(Icons.shopping_cart_sharp)),
            );
          },
        )
      ]);

  // TODO: will be held
  BottomNavigationBar _buildBottomNavigationBar(BuildContext context) =>
      BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.black.withOpacity(0.1),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: '',
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: '',
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: '',
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: '',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: context.currentTheme.colorScheme.primary,
        onTap: (index) {
          print(index);
        },
      );

  ListView _buildProductCardFromListView(HomeState state) => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: state.foodList != null ? state.foodList.length : 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Row(
          children: [
            SizedBox(
              width: context.customWidthValue(0.5),
              child: _buildProductCard(state, index),
            ),
            SizedBox(
              width: context.customWidthValue(0.05),
            ),
          ],
        ),
      );

  ProductCard _buildProductCard(HomeState state, int index) => ProductCard(
        imagePath: state.foodList[index].imagePaths[0],
        foodName: state.foodList[index].foodName,
        foodPrice: state.foodList[index].price.toDouble(),
      );

  CustomTabBar _buildCustomTabBar(BuildContext context) => CustomTabBar(
        tabs: FoodTypesModel.instance.foodTypesList,
        selectedTextStyle: context.currentTheme.textTheme.subtitle1,
        unSelectedTextStyle: context.currentTheme.textTheme.subtitle2,
        tabColor: context.currentTheme.colorScheme.primary,
        changeIndex: context.read<HomeCubit>().changeTabBarIndex,
      );

  SearchBar _buildSearchBar(BuildContext context) => SearchBar(
        textStyle: context.currentTheme.textTheme.bodyText1,
        searchTextController: _searchTextController,
        onSubmitted: (value) {
          context.read<HomeCubit>().getFoodsInSearchResult(value);
          context.read<HomeCubit>().goToSearchView();
        },
      );

  void _exitSearchBar() {
    FocusScope.of(_scaffoldKey.currentContext).requestFocus(new FocusNode());
    _searchTextController.clear();
  }
}
