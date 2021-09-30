import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_delivery/core/components/button/counter_button.dart';
import 'package:food_delivery/core/components/container/round_edge_container.dart';
import 'package:food_delivery/core/extension/context_extension.dart';
import 'package:food_delivery/product/widgets/button/circle_button.dart';
import 'package:food_delivery/view/home/_model/food_model.dart';

class SlidableFoodCard extends StatelessWidget {
  const SlidableFoodCard(
      {Key key,
      @required this.food,
      this.onTap,
      @required this.decrease,
      @required this.increase,
      @required this.numberOfFoodInCart,
      @required this.likeFood,
      @required this.removeFood})
      : super(key: key);

  final VoidCallback decrease;
  final FoodModel food;
  final VoidCallback increase;
  final VoidCallback likeFood;
  final int numberOfFoodInCart;
  final VoidCallback onTap;
  final VoidCallback removeFood;

  List<Widget> _buildSecondaryActions(BuildContext context) => [
        _buildCircleButton(
            likeFood, Icon(Icons.favorite_border_outlined), context),
        _buildCircleButton(removeFood, Icon(Icons.delete_outlined), context)
      ];

  CounterButton _buildCounterButton(BuildContext context) => CounterButton(
        text: numberOfFoodInCart.toString(),
        increase: increase,
        decrease: decrease,
        primaryColor: context.currentTheme.primaryColor,
        onPrimaryColor: context.currentTheme.colorScheme.onPrimary,
        textStyle: context.currentTheme.textTheme.bodyText2
            .copyWith(color: context.currentTheme.colorScheme.onPrimary),
      );

  CircleButton _buildCircleButton(
          VoidCallback onPressed, Icon icon, BuildContext context) =>
      CircleButton(
        onPressed: onPressed,
        icon: icon,
        size: 15.0,
        primary: context.currentTheme.colorScheme.secondaryVariant,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Slidable(
        child: RoundEdgeContainer(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(food.imagePaths[0]),
            ),
            title: Text(
              food.foodName,
              overflow: TextOverflow.ellipsis,
              style: context.currentTheme.textTheme.bodyText1,
            ),
            subtitle: Text(
              '\n${food.price} \$\n',
              style: context.currentTheme.textTheme.subtitle1,
            ),
            trailing: _buildCounterButton(context),
            onTap: onTap,
          ),
        ),
        secondaryActions: _buildSecondaryActions(context),
        actionPane: SlidableDrawerActionPane(),
      ),
    );
  }
}
