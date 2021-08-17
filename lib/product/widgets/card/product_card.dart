import 'package:flutter/material.dart';
import 'package:food_delivery/core/components/container/round_edge_container.dart';
import 'package:food_delivery/core/extension/context_extension.dart';
import 'package:food_delivery/product/widgets/column/two_text_columns.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key key,
      @required this.imagePath,
      @required this.foodName,
      @required this.foodPrice,
      this.padding})
      : super(key: key);

  final String foodName;
  final double foodPrice;
  final String imagePath;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return RoundEdgeContainer(
      child: Padding(
        padding: padding ?? context.paddingUltraLowSymetric,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: context.highWidthValue,
              height: context.normalHightValue,
              child: CircleAvatar(
                backgroundImage: NetworkImage(imagePath),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            TwoTextColumns(foodName: foodName, foodPrice: foodPrice),
          ],
        ),
      ),
    );
  }
}
