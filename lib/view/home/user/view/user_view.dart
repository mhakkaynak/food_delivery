import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/components/container/round_edge_container.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/init/database/database_manager.dart';
import '../../../../product/constants/image_path.dart';
import '../../../authentication/entry/model/user_model.dart';

class UserView extends StatefulWidget {
  const UserView({Key key}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  UserModel _user;
  @override
  void initState() {
    super.initState();
    setState(() {
      _init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: context.paddingLowSymetric,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My profile',
              style: context.currentTheme.textTheme.headline4,
            ),
            Text(
              'Personel details',
              style: context.currentTheme.textTheme.bodyText1,
            ),
            RoundEdgeContainer(
              child: Padding(
                padding: context.paddingLowSymetric,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      ImagePath.instance.userIcon,
                      width: 64,
                      height: 64,
                    ),
                    _buildTextsColumn(context),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column _buildTextsColumn(BuildContext context) {
    List<Text> textList;
    if (_user != null) {
      textList = [
        Text(
          _user.name,
          style: context.currentTheme.textTheme.bodyText1,
        ),
        Text(_user.email),
        Text(_user.phone),
        Text(_user.address),
      ];
    } else {
      for (var i = 0; i < 4; i++) {
        Text('');
      }
    }
    return Column(
      children: textList,
    );
  }

  Future<void> _init() async {
    _user = await DbManager.instance.fetchUser(UserModel.empty()) as UserModel;
    print(_user.address);
  }
}
