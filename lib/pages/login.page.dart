import 'package:flappwrite_chat/res/routes.dart';
import 'package:flutter/material.dart';
import 'package:flappwrite_account_kit/flappwrite_account_kit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          const Text('Login'),
          const SizedBox(height: 16.0),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
            obscureText: true,
          ),
          const SizedBox(height: 10.0),
          TextButton(
            child: const Text('Not a member yet? Register'),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.signup),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            child: context.authNotifier.status == AuthStatus.authenticating
                ? const CircularProgressIndicator()
                : const Text('Login'),
            onPressed: context.authNotifier.status == AuthStatus.authenticating
                ? null
                : _login,
          ),
        ],
      ),
    );
  }

  Future<void> _login() async {
    bool isLoggedIn = await context.authNotifier.createSession(
      email: _emailController.text,
      password: _passwordController.text,
    );
    if (!isLoggedIn) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.authNotifier.error ?? 'Unknown error')),
      );
    }
  }
}
