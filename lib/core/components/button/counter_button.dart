import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  const CounterButton(
      {Key key,
      this.primaryColor,
      this.onPrimaryColor,
      this.textStyle,
      @required this.increase,
      @required this.decrease,
      this.text})
      : super(key: key);

  final VoidCallback decrease;
  final VoidCallback increase;
  final Color onPrimaryColor;
  final Color primaryColor;
  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32), color: primaryColor),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          IconButton(
            splashRadius: 8.0,
            onPressed: decrease,
            icon: Icon(Icons.remove),
            color: onPrimaryColor,
          ),
          Text(
            text ?? '1',
            style: textStyle,
          ),
          IconButton(
            splashRadius: 8.0,
            onPressed: increase,
            icon: Icon(Icons.add),
            color: onPrimaryColor,
          ),
        ],
      ),
    );
  }
}
