import 'package:flutter/material.dart';

class RoundEdgeContainer extends StatelessWidget {
  RoundEdgeContainer({Key key, this.color, this.radius, @required this.child})
      : super(key: key);

  final Color color;
  final double radius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(radius ?? 32),
      ),
      child: child,
    );
  }
}
