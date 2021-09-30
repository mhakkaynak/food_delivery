import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton(
      {Key key,
      this.primary,
      this.onPrimary,
      @required this.onPressed,
      @required this.icon,
      this.size})
      : super(key: key);

  final Icon icon;
  final VoidCallback onPressed;
  final Color onPrimary;
  final Color primary;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(size ?? 8.0),
          primary: primary,
          onPrimary: onPrimary,
        ),
        onPressed: onPressed,
        child: icon);
  }
}
