import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/extension/context_extension.dart';

class PaymentListTile extends StatelessWidget {
  const PaymentListTile(
      {Key key, this.iconPath, @required this.text, @required this.radioButton})
      : super(key: key);

  final String iconPath;
  final Radio radioButton;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: iconPath != null ? SvgPicture.asset(iconPath) : SizedBox(),
      title: Text(
        text,
        style: context.currentTheme.textTheme.bodyText1,
      ),
      trailing: radioButton,
    );
  }
}
