import 'package:flutter/material.dart';
import 'package:food_delivery/core/components/container/round_edge_container.dart';
import 'package:food_delivery/core/extension/context_extension.dart';
import 'package:food_delivery/product/widgets/card/product_card.dart';
import 'package:food_delivery/product/widgets/column/two_text_columns.dart';
import 'package:food_delivery/view/home/model/food_model.dart';

class SearchResultView extends StatelessWidget {
  final List<FoodModel> foodList;
  const SearchResultView({Key key, @required this.foodList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: context.customHeigthValue(0.03),
      crossAxisSpacing: context.customWidthValue(0.03),
      childAspectRatio: 0.5,
      children: List.generate(
        foodList.length,
        (index) => ProductCard(
            imagePath: foodList[index].imagePaths.first,
            foodName: foodList[index].foodName,
            foodPrice: foodList[index].price.toDouble(),
            padding: context.paddingUltraLowSymetric / 2),
      ),
    );
  }
}
