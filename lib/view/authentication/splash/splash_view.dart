import 'package:flutter/material.dart';
import '../../../product/constants/image_path.dart';
import '../entry/model/user_model.dart';

import '../../../../core/constants/navigation/navigation_constant.dart';
import '../../../../core/init/database/database_manager.dart';
import '../../../../core/init/navigation/navigation_manager.dart';


class SplashView extends StatelessWidget {
  const SplashView({Key key}) : super(key: key);

    @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagePath.instance.splashImage),
                fit: BoxFit.cover)),
      ),
    );
  }
    Future<void> getData() async {
    final db = DbManager();
    final user = await db.fetchUser(UserModel.empty()) as UserModel;
    if (user == null) {
      await NavigationManager.instance.navigationToPage(NavigationConstant.LOGIN);
    }
    await NavigationManager.instance.navigationToPage(NavigationConstant.HOME);
  }
}