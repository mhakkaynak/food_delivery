import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar(
      {Key key,
      @required this.textStyle,
      @required this.searchTextController,
      @required this.onSubmitted})
      : super(key: key);

  final Function onSubmitted;
  final TextEditingController searchTextController;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      style: textStyle,
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(Icons.search),
      ),
      controller: searchTextController,
    );
  }
}
