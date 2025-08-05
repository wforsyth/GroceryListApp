import 'package:flutter/material.dart';
import 'package:twoplayercrossword/screens/prelogin.dart';
import 'screens/login.dart';
import 'screens/register.dart';
import 'screens/bottomNav.dart';

//Class to manage all named routes in the app
class AppRoutes {
  //Route names
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String prelogin = '/prelogin';

//Maps named routes to widgets within the application
  static Map<String, WidgetBuilder> routes = {
    login: (context) => LoginScreen(),
    register: (context) => RegisterScreen(),
    home: (context) => HomeScreen(),
    prelogin: (context) => PreLoginScreen(),
  };
}