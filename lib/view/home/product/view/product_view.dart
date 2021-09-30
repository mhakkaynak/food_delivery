import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/components/text/text_with_single_child_scroll_view.dart';
import 'package:food_delivery/product/widgets/column/two_text_columns.dart';

import '../../../../core/components/button/custom_elevated_button.dart';
import '../../../../core/components/circle_avatar/scrolling_circle_avatar.dart';
import '../../../../core/extension/context_extension.dart';
import '../../_model/food_model.dart';
import '../cubit/product_cubit.dart';

// ignore: must_be_immutable
class ProductView extends StatelessWidget {
  ProductView({Key key}) : super(key: key);

  FoodModel food;

  Column _buildUnderBodyColumn(BuildContext context) {
    return Column(
      children: [
        _buildTwoTextColumns(context),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildText('Delivery Info\n', context),
              Expanded(
                child: _buildTextWithSingleChildScrollView(
                    food.deliveryInfo, context),
              ),
              _buildText('\nReturn Policy\n', context),
              Expanded(
                child: _buildTextWithSingleChildScrollView(
                    food.returnPolicy, context),
              ),
              _buildAddToCartButton(context)
            ],
          ),
        ),
      ],
    );
  }

  Text _buildText(String data, BuildContext context) {
    return Text(
      data,
      style: context.currentTheme.textTheme.bodyText1,
    );
  }

  CustomElevatedButton _buildAddToCartButton(BuildContext context) {
    return CustomElevatedButton(
      width: context.customWidthValue(0.8),
      height: context.customHeigthValue(0.06),
      onPressed: context.read<ProductCubit>().addCart,
      widget: Text('Add to cart'),
    );
  }

  TextWithSingleChildScrollView _buildTextWithSingleChildScrollView(
      String data, BuildContext context) {
    return TextWithSingleChildScrollView(
        data: data, textStyle: context.currentTheme.textTheme.bodyText2);
  }

  TwoTextColumns _buildTwoTextColumns(BuildContext context) {
    return TwoTextColumns(
      foodName: food.foodName,
      foodPrice: food.price.toDouble(),
      textStyle1: context.currentTheme.textTheme.headline4,
    );
  }

  AppBar _buildAppbar(BuildContext context, ProductState state) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: context.read<ProductCubit>().likeFood,
          icon: state.wasItLiked ?? false
              ? Icon(
                  Icons.favorite,
                  color: context.currentTheme.primaryColor,
                )
              : Icon(Icons.favorite_border_outlined),
        ),
      ],
    );
  }

  Widget _buildScrollingCircleAvatar(BuildContext context) {
    return ScrollingCircleAvatar(
        imagePaths: food.imagePaths,
        primaryColor: context.currentTheme.colorScheme.primary,
        secondaryColor: context.currentTheme.colorScheme.primaryVariant);
  }

  @override
  Widget build(BuildContext context) {
    food = ModalRoute.of(context).settings.arguments as FoodModel;
    return BlocProvider(
      create: (context) => ProductCubit(foodId: food.id),
      child: BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
        return Scaffold(
          appBar: _buildAppbar(context, state),
          body: Padding(
            padding: context.paddingLowSymetric,
            child: Column(
              children: [
                Expanded(
                  child: _buildScrollingCircleAvatar(context),
                ),
                Expanded(
                  child: _buildUnderBodyColumn(context),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
