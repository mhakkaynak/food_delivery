import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onPressed;
  final VoidCallback onLongPressed;
  final Widget widget;
  const CustomElevatedButton(
      {Key key,
      this.width,
      this.height,
      @required this.onPressed,
      this.onLongPressed,
      @required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: widget,
      ),
    );
  }
}
