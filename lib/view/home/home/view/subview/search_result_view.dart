import 'package:flutter/material.dart';
import '../../../../../core/extension/context_extension.dart';
import '../../../../../product/widgets/card/product_card.dart';
import '../../model/food_model.dart';

class SearchResultView extends StatelessWidget {
  final List<FoodModel> foodList;
  const SearchResultView({Key key, @required this.foodList}) : super(key: key);

  // TODO: will be page
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
