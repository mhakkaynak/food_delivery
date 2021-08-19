import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  CustomTabBar(
      {Key key,
      @required this.tabs,
      @required this.selectedTextStyle,
      @required this.unSelectedTextStyle,
      @required this.tabColor,
      @required this.changeIndex})
      : super(key: key);
  final List<String> tabs;
  final TextStyle selectedTextStyle;
  final TextStyle unSelectedTextStyle;
  final Color tabColor;
  final Function changeIndex;

  @override
  _CustomTabBarState createState() => _CustomTabBarState(
      tabs: tabs,
      selectedTextStyle: selectedTextStyle,
      unSelectedTextStyle: unSelectedTextStyle,
      tabColor: tabColor,
      changeIndex: changeIndex);
}

class _CustomTabBarState extends State<CustomTabBar> {
  final List<String> tabs;
  final TextStyle selectedTextStyle;
  final TextStyle unSelectedTextStyle;
  final Color tabColor;
  final Function changeIndex;
  var _tabBarIndex = 0;
  _CustomTabBarState(
      {@required this.changeIndex,
      @required this.tabs,
      @required this.selectedTextStyle,
      @required this.unSelectedTextStyle,
      @required this.tabColor});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            child: _buildColumn(index),
            onTap: () {
              _onTap(index);
            },
          ),
        );
      },
      itemCount: tabs.length,
    );
  }

  Column _buildColumn(int index) => Column(
        children: [
          Text(
            tabs[index],
            style:
                _indexControl(index) ? selectedTextStyle : unSelectedTextStyle,
          ),
          SizedBox(
            height: 8,
          ),
          Opacity(
            opacity: _indexControl(index) ? 1 : 0,
            child: _buildContainer,
          ),
        ],
      );

  Container get _buildContainer => Container(
        decoration: BoxDecoration(
          color: tabColor,
          borderRadius: BorderRadius.circular(12),
        ),
        height: 4,
        width: 64,
      );

  void _onTap(int index) {
    setState(() {
      _tabBarIndex = index;
    });
    changeIndex(index);
  }

  bool _indexControl(int index) => _tabBarIndex == index;
}
