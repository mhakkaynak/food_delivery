import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';

class TwoTextColumns extends StatelessWidget {
  const TwoTextColumns(
      {Key key,
      @required this.foodName,
      @required this.foodPrice,
      this.textStyle1,
      this.textStyle2})
      : super(key: key);
  final String foodName;
  final double foodPrice;
  final TextStyle textStyle1;
  final TextStyle textStyle2;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          foodName,
          style: textStyle1 ?? context.currentTheme.textTheme.headline5,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: context.customHeigthValue(0.02),
        ),
        Text(
          '$foodPrice \$',
          style: textStyle2 ?? context.currentTheme.textTheme.headline6,
        ),
      ],
    );
  }
}
