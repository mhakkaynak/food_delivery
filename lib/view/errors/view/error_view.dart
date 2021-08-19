import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/navigation/navigation_constant.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/navigation/navigation_manager.dart';
import '../../../product/constants/image_path.dart';
import '../../../product/widgets/button/elevated_text_button.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.paddingLowSymetric,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: context.highHeightValue,
              child: SvgPicture.asset(
                ImagePath.instance.errorIcon,
              ),
            ),
            Text('Error', style: context.currentTheme.textTheme.headline4),
            Text(
              'This page is currently unavailable, plase try again later.',
              style: context.currentTheme.textTheme.subtitle2,
            ),
            SizedBox(
              height: context.customHeigthValue(0.05),
            ),
            ElevatedTextButton(
                onPressed: () {
                  NavigationManager.instance
                      .navigationToPage(NavigationConstant.HOME);
                },
                text: 'Try again'),
          ],
        ),
      ),
    );
  }
}
