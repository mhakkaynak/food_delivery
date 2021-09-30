import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/product/widgets/button/elevated_text_button.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../product/widgets/card/slidable_food_card.dart';
import '../../_model/food_model.dart';
import '../cubit/cart_cubit.dart';

class CartView extends StatefulWidget {
  CartView({Key key}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  bool _didDataCome = false;

  Wrap _buildInfoText(BuildContext context) => Wrap(children: [
        Icon(Icons.swipe_outlined),
        Text(
          '\t\t\t\tswipe on an item to delete',
          style: context.currentTheme.textTheme.bodyText2,
        ),
      ]);

  ListView _buildListView(CartState state, BuildContext context) =>
      ListView.builder(
        itemCount: state.products.length,
        itemBuilder: (_, index) {
          final _food = state.products[index].food;
          return _buildSlidableFoodCard(
              _food, context, state.products[index].foodCounter);
        },
      );

  SlidableFoodCard _buildSlidableFoodCard(
          FoodModel food, BuildContext context, int numberOfFoodInCart) =>
      SlidableFoodCard(
        food: food,
        onTap: () {
          context.read<CartCubit>().goToProductView(food);
        },
        decrease: () {
          context.read<CartCubit>().decreaseProductInCart(food.id);
        },
        increase: () {
          context.read<CartCubit>().increaseProductInCart(food.id);
        },
        numberOfFoodInCart: numberOfFoodInCart,
        likeFood: () {
          context.read<CartCubit>().likeFood(context, food.id);
        },
        removeFood: () {
          context.read<CartCubit>().removeFromCart(food.id);
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cart',
          style: context.currentTheme.textTheme.headline5,
        ),
      ),
      body: Padding(
        padding: context.paddingLowSymetric,
        child: BlocBuilder<CartCubit, CartState>(builder: (blocContext, state) {
          if (!_didDataCome) {
            context.read<CartCubit>().getCart();
            _didDataCome = true;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildInfoText(context),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildListView(state, context),
                ),
              ),
              ElevatedTextButton(
                  onPressed: context.read<CartCubit>().goToPaymentView,
                  text: 'Complate order')
            ],
          );
        }),
      ),
    );
  }
}
