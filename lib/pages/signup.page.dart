import 'package:flappwrite_chat/services/appwrite.service.dart';
import 'package:flutter/material.dart';
import 'package:flappwrite_account_kit/flappwrite_account_kit.dart';

// signup page flutter
class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  Widget _signupButton() {
    return ElevatedButton(
        onPressed: () async {
          if (_emailController.text.isEmpty ||
              _passwordController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Please fill all the fields'),
            ));
            return;
          }

          final name = _nameController.text;
          final email = _emailController.text;
          final password = _passwordController.text;

          final user = await context.authNotifier.create(
            email: email,
            password: password,
            name: name,
          );

          if (user == null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(context.authNotifier.error ?? 'Signup failed'),
            ));
          } else {
            // save to collection
            appwrite.saveUser(
                name: user.name, email: user.email, userId: user.id);
            Navigator.pop(context);
          }
        },
        child: const Text("Signup"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: "Name",
            ),
          ),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: "Email",
            ),
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: "Password",
            ),
            obscureText: true,
          ),
          const SizedBox(height: 20.0),
          _signupButton(),
        ],
      ),
    );
  }
}
