import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components/container/round_edge_container.dart';
import '../../../../../core/components/search_bar/search_bar.dart';
import '../../../../../core/extension/context_extension.dart';
import '../../../../../product/widgets/card/product_card.dart';
import '../../cubit/home_cubit.dart';

class SearchView extends StatelessWidget {
  SearchView({
    Key key,
  }) : super(key: key);
  final _searchBarTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            context.read<HomeCubit>().goToBackView();
            return true;
          },
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(context.lowHeightValue),
              child: AppBar(
                flexibleSpace: _buildSearchBar(context),
                leading: _buildIconButtonOfAppBar(context),
              ),
            ),
            body: RoundEdgeContainer(
              color: context.currentTheme.colorScheme.onBackground,
              child: Padding(
                padding: context.paddingUltraLowSymetric,
                child: _buildGridView(context, state),
              ),
            ),
          ),
        );
      },
    );
  }

  Padding _buildSearchBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: context.customWidthValue(0.16),
          left: context.customWidthValue(0.16),
          top: 8),
      child: Align(
        alignment: Alignment.centerRight,
        child: SearchBar(
            textStyle: context.currentTheme.textTheme.bodyText1,
            searchTextController: _searchBarTextController,
            onSubmitted: context.read<HomeCubit>().getFoodsInSearchResult),
      ),
    );
  }

  Widget _buildIconButtonOfAppBar(BuildContext context) => IconButton(
        onPressed: context.read<HomeCubit>().goToBackView,
        icon: Icon(Icons.keyboard_arrow_left_rounded),
        iconSize: context.customHeigthValue(0.05),
      );

  GridView _buildGridView(BuildContext context, HomeState state) =>
      GridView.count(
        physics: BouncingScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: context.customHeigthValue(0.05),
        crossAxisSpacing: context.customWidthValue(0.05),
        childAspectRatio: 0.5,
        children: List.generate(
          state.foodList.length,
          (index) => _buildProductCard(state, index, context),
        ),
      );

  ProductCard _buildProductCard(
          HomeState state, int index, BuildContext context) =>
      ProductCard(
          imagePath: state.foodList[index].imagePaths.first,
          foodName: state.foodList[index].foodName,
          foodPrice: state.foodList[index].price.toDouble(),
          padding: context.paddingUltraLowSymetric / 2);
}
