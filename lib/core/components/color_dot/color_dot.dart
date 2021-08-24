import 'package:flutter/material.dart';

class ColorDot extends StatelessWidget {
  ColorDot({
    Key key,
    @required this.primaryColor,
    @required this.secondaryColor,
    @required this.size,
    @required this.isSelected,
  }) : super(key: key);

  final bool isSelected;
  final Color primaryColor;
  final Color secondaryColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return _buildSizedBox(
      size,
      size,
      CircleAvatar(
        backgroundColor: isSelected ? primaryColor : secondaryColor,
        child: _buildSizedBox(
          size / 3.0,
          size / 3.0,
          CircleAvatar(
            backgroundColor: secondaryColor,
          ),
        ),
      ),
    );
  }

  SizedBox _buildSizedBox(double height, double width, Widget widget) =>
      SizedBox(
        height: height,
        width: width,
        child: widget,
      );
}
