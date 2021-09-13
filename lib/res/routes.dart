import 'package:flappwrite_chat/main.dart';
import 'package:flappwrite_chat/pages/login.page.dart';
import 'package:flappwrite_chat/pages/profile.page.dart';
import 'package:flappwrite_chat/pages/signup.page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String profile = '/profile';

  //on generate route
  static Route<dynamic> generateRoute(RouteSettings settings) {
    const mainScreen = MainScreen();
    switch (settings.name) {
      case home:
        return _buildRoute(settings, mainScreen);
      case signup:
        return _buildRoute(settings, const SignupPage());
      case login:
        return _buildRoute(settings, const LoginPage());
      case profile:
        return _buildRoute(settings, const ProfilePage());
      default:
        return _buildRoute(settings, mainScreen);
    }
  }

  //route builder
  static _buildRoute(RouteSettings settings, Widget page) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => page,
    );
  }
}
