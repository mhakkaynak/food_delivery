import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../color_dot/color_dot_list_view.dart';

class ScrollingCircleAvatar extends StatefulWidget {
  ScrollingCircleAvatar(
      {Key key,
      @required this.imagePaths,
      @required this.primaryColor,
      @required this.secondaryColor})
      : super(key: key);
  final List<String> imagePaths;
  final Color primaryColor;
  final Color secondaryColor;
  @override
  _ScrollingCircleAvatarState createState() => _ScrollingCircleAvatarState();
}

class _ScrollingCircleAvatarState extends State<ScrollingCircleAvatar> {
  int _index = 0;
  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            flex: 3,
            child: _buildPageView,
          ),
          Expanded(
            flex: 1,
            child: _buildColorDotListView,
          ),
        ],
      );

  Widget get _buildColorDotListView => Align(
        child: ColorDotListView(
          itemCount: widget.imagePaths.length,
          primaryColor: widget.primaryColor,
          secondaryColor: widget.secondaryColor,
          selectedIndex: _index,
        ),
      );

  PageView get _buildPageView => PageView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, position) {
          _changeIndex(position);

          return _buildCircleAvatar(position);
        },
        itemCount: widget.imagePaths.length,
      );

  CircleAvatar _buildCircleAvatar(int position) => CircleAvatar(
        backgroundImage:
            NetworkImage(widget.imagePaths[position].replaceAll(' ', '')),
      );

  void _changeIndex(int position) {
    if (_index != position) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _index = position;
        });
      });
    }
  }
}
