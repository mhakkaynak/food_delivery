import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/view/authentication/entry/cubit/sign_up/sign_up_cubit.dart';
import 'package:food_delivery/view/home/cubit/home_cubit.dart';

import 'core/init/navigation/navigation_manager.dart';
import 'core/init/navigation/navigation_route_manager.dart';
import 'core/init/theme/app_theme_ligth.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<SignUpCubit>(create: (context) => SignUpCubit()),
      BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
      
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        themeMode: ThemeMode.system,
        navigatorKey: NavigationManager.instance.navigationKey,
        onGenerateRoute: (args) =>
            NavigationRouteManager.instance.generateRoute(args),
        initialRoute: '/',
        theme: AppThemeLight.instance.ligthTheme,
      );
}
