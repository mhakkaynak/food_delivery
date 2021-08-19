import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';

class TwoTextColumns extends StatelessWidget {
  const TwoTextColumns(
      {Key key, @required this.foodName, @required this.foodPrice})
      : super(key: key);
  final String foodName;
  final double foodPrice;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          foodName,
          style: context.currentTheme.textTheme.headline5,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: context.customHeigthValue(0.02),
        ),
        Text(
          '$foodPrice \$',
          style: context.currentTheme.textTheme.headline6,
        ),
      ],
    );
  }
}
