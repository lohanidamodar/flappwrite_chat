import 'package:flappwrite_account_kit/flappwrite_account_kit.dart';
import 'package:flappwrite_chat/pages/home.page.dart';
import 'package:flappwrite_chat/pages/login.page.dart';
import 'package:flappwrite_chat/pages/splash.page.dart';
import 'package:flappwrite_chat/res/routes.dart';
import 'package:flappwrite_chat/services/appwrite.service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlAppwriteAccountKit(
      client: appwrite.client,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authNotifier = context.authNotifier;
    const loginPage = LoginPage();
    switch (authNotifier.status) {
      case AuthStatus.uninitialized:
        return const SplashPage();
      case AuthStatus.authenticated:
        return const HomePage();
      case AuthStatus.authenticating:
        return loginPage;
      case AuthStatus.unauthenticated:
        return loginPage;
    }
  }
}
