import 'package:flutter/material.dart';
import 'package:shop/screens/login_screens.dart';

import '../screens/home_screens.dart';
import '../screens/register_screens.dart';

class Routes {
  static const String login = '/login';
  static const String home = '/home';
  static const String register = '/register';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      default:
        return null;
    }
  }
}