import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/button/custom_elevated_button.dart';
import '../../../../core/components/color_dot/color_dot_list_view.dart';
import '../../../../core/extension/context_extension.dart';
import '../../_model/food_model.dart';
import '../cubit/product_cubit.dart';

class ProductView extends StatefulWidget {
  ProductView({
    Key key,
  }) : super(key: key);
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  FoodModel food;
  @override
  Widget build(BuildContext context) {
    food = ModalRoute.of(context).settings.arguments as FoodModel;
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  context.read<ProductCubit>().likeFood(food.id);
                },
                icon: true
                    ? Icon(Icons.favorite_border_outlined)
                    : Icon(
                        Icons.favorite,
                        color: context.currentTheme.primaryColor,
                      ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: context.paddingLowSymetric,
        child: Column(
          children: [
            Expanded(
              child: _buildScrollingAvatar(context),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    food.foodName,
                    style: context.currentTheme.textTheme.headline4,
                  ),
                  Text(
                    '${food.price} \$\n',
                    style: context.currentTheme.textTheme.headline6,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Delivery Info\n',
                          style: context.currentTheme.textTheme.bodyText1,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              food.deliveryInfo,
                              style: context.currentTheme.textTheme.bodyText2,
                            ),
                          ),
                        ),
                        Text(
                          '\nReturn Policy\n',
                          style: context.currentTheme.textTheme.bodyText1,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              food.returnPolicy,
                              style: context.currentTheme.textTheme.bodyText2,
                            ),
                          ),
                        ),
                        CustomElevatedButton(
                          width: context.customWidthValue(0.8),
                          height: context.customHeigthValue(0.06),
                          onPressed: () {
                            // TODO: odeme sayfsina gidecek
                          },
                          widget: Text('Add to cart'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScrollingAvatar(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (_, position) {
                  context.read<ProductCubit>().changeIndex(position);
                  return CircleAvatar(
                    backgroundImage: NetworkImage(
                        food.imagePaths[state.index].replaceAll(' ', '')),
                  );
                },
                itemCount: food.imagePaths.length,
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                child: ColorDotListView(
                  itemCount: food.imagePaths.length,
                  primaryColor: context.currentTheme.colorScheme.primary,
                  secondaryColor:
                      context.currentTheme.colorScheme.primaryVariant,
                  selectedIndex: state.index,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
