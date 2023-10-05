import 'package:ecco_app/features/home/presentation/view/home_screen.dart';
import 'package:ecco_app/features/login/presentation/view/login_screen.dart';
import 'package:ecco_app/features/register/presentation/view/register_screen.dart';
import 'package:flutter/material.dart';

import '../../features/nav_bar_root/presentation/view/nav_bar_root_screen.dart';
import '../../features/splash/view/splash_screen.dart';
import 'cash_healper.dart';


abstract class AppRouter {
  static const String splash_screen = '/';
  static const String login_screen = '/login_screen';
  static const String register_screen = '/register_screen';
  static const String home_screen="/home_screen";
  static const String nav_bar_root_scrren ="/NavBarRootScreen";

 static var token = CasheHelper.getDataString(key: "token");

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash_screen:
        return MaterialPageRoute(builder: (_) => (token!=null?const NavBarRootScreen():const SplashScreen()),);
      case login_screen:
        return MaterialPageRoute(builder: (_) =>const LoginScreen(),);
      case register_screen:
        return MaterialPageRoute(builder: (_) =>const RegisterScreen(),);
      default:
      // Handle unknown routes or errors
        return MaterialPageRoute(
          builder: (_) =>const Scaffold(
            body: Center(
              child: Text('Route not found!'),
            ),
          ),
        );
    }
  }
}
