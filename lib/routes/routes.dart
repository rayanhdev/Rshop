import 'package:flutter/material.dart';
import 'package:shop/screens/items_screens.dart';
import 'package:shop/screens/login_screens.dart';

import '../screens/home_screens.dart';
import '../screens/register_screens.dart';
import '../views/boutique_views.dart';

class Routes {
  static const String login = '/login';
  static const String home = '/home';
  static const String register = '/register';
  static const String items = '/items';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case items:
        if (args is Product) {
          return MaterialPageRoute(builder: (_) => ItemsPage(product: args));
        }
        return null;
      default:
        return null;
    }
  }
}
