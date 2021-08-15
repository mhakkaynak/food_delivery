import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../product/constants/image_path.dart';
import 'login_view.dart';
import 'sign_up_view.dart';

class EntryView extends StatefulWidget {
  const EntryView({Key key}) : super(key: key);

  @override
  _EntryViewState createState() => _EntryViewState();
}

class _EntryViewState extends State<EntryView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool _resizeToAvoidBottomInset = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.index == 0) {
        setState(() {
          _resizeToAvoidBottomInset = false;
        });
      } else {
        setState(() {
          _resizeToAvoidBottomInset = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: _resizeToAvoidBottomInset,
        body: Column(
          children: [
            Container(
              decoration: buildContainerBoxDecoration,
              height: context.highHeightValue,
              width: context.width,
              child: buildColumn,
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  LoginView(),
                  SignUpView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration get buildContainerBoxDecoration => BoxDecoration(
        color: context.currentTheme.colorScheme.onPrimary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      );

  Column get buildColumn => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(
            flex: 5,
          ),
          Expanded(
            flex: 8,
            child: Image.asset(ImagePath.instance.foodDeliveryIcon),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 3,
            child: buildTabBar,
          ),
        ],
      );

  TabBar get buildTabBar => TabBar(
        indicatorPadding: EdgeInsets.symmetric(
          horizontal: context.customWidthValue(0.08),
        ),
        controller: _tabController,
        tabs: [
          Tab(
            text: 'Login',
          ),
          Tab(
            text: 'Sign-up',
          ),
        ],
      );
}
