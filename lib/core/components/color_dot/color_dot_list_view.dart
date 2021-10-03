import 'package:flutter/material.dart';

import 'color_dot.dart';

// ignore: must_be_immutable
class ColorDotListView extends StatefulWidget {
  ColorDotListView(
      {Key key,
      @required this.itemCount,
      @required this.primaryColor,
      @required this.secondaryColor,
      @required this.selectedIndex,
      this.changeIndex})
      : super(key: key);
  final int itemCount;
  final Color primaryColor;
  final Color secondaryColor;
  final Function changeIndex;
  int selectedIndex;

  @override
  _ColorDotListViewState createState() => _ColorDotListViewState();
}

class _ColorDotListViewState extends State<ColorDotListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: widget.itemCount,
      itemBuilder: (BuildContext context, int index) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: GestureDetector(
              onTap: () {
                if (widget.changeIndex != null) {
                  widget.changeIndex(index);
                  setState(() {
                    widget.selectedIndex = index;
                  });
                }
              },
              child: _buildColorDot(index),
            ),
          ),
        );
      },
    );
  }

  ColorDot _buildColorDot(int index) {
    return ColorDot(
        primaryColor: widget.primaryColor,
        secondaryColor: widget.secondaryColor,
        size: 12,
        isSelected: widget.selectedIndex == index);
  }
}
