import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
  final bool obcureText;
  final TextEditingController textController;
  final String hintText;
  final String labelText;
  final Widget suffix;
  final Function validator;
  const CustomTextFormField({
    Key key,
    this.textInputType,
    this.obcureText,
    @required this.textController,
    @required this.hintText,
    @required this.labelText,
    this.suffix,
    this.validator,
    this.textCapitalization,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      keyboardType: textInputType,
      obscureText: obcureText ?? false,
      controller: textController,
      style: context.currentTheme.textTheme.bodyText1,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        suffix: suffix,
      ),
      validator: validator,
    );
  }
}
