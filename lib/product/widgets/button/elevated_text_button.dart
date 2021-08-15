import 'package:flutter/material.dart';

import '../../../core/components/button/custom_elevated_button.dart';
import '../../../core/extension/context_extension.dart';

class ElevatedTextButton extends StatelessWidget {
  final double width;
  final VoidCallback onPressed;
  final VoidCallback onLongPressed;
  final String text;
  const ElevatedTextButton(
      {Key key,
      this.width,
      @required this.onPressed,
      this.onLongPressed,
      @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      width: width ?? context.customWidthValue(0.75),
      height: 64,
      onPressed: onPressed,
      widget: Text(text),
      onLongPressed: onLongPressed,
    );
  }
}
