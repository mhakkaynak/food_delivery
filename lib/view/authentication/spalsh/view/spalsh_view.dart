import 'package:flutter/material.dart';
import 'package:food_delivery/core/init/database/database_manager.dart';
import 'package:food_delivery/view/authentication/entry/model/user_model.dart';

import '../../../../core/constants/navigation/navigation_constant.dart';
import '../../../../core/init/navigation/navigation_manager.dart';

class SpalshView extends StatefulWidget {
  SpalshView({Key key}) : super(key: key);

  @override
  _SpalshViewState createState() => _SpalshViewState();
}

class _SpalshViewState extends State<SpalshView> {
  @override
  Widget build(BuildContext context) {
    getData();

    return Scaffold(
      body: Center(
        child: Text('Spalsh View'),
      ),
    );
  }

  Future<void> getData() async {
    final db = DbManager();
    await db.fetch(UserModel.empty());
    NavigationManager.instance
        .navigationToPage(NavigationConstant.LOGIN); // TODO will be deleted
  }
}
