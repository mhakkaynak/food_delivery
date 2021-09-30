import 'package:flutter/material.dart';

class TextWithSingleChildScrollView extends StatelessWidget {
  const TextWithSingleChildScrollView(
      {Key key, @required this.data, this.textStyle})
      : super(key: key);

  final String data;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Text(
        data,
        style: textStyle,
      ),
    );
  }
}
