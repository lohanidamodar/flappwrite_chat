import 'package:flappwrite_chat/models/user.dart';
import 'package:flappwrite_chat/res/routes.dart';
import 'package:flappwrite_chat/services/appwrite.service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  _getUsers() async {
    _users = await appwrite.getUsers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Appwrite Chat'), actions: [
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: () => Navigator.of(context).pushNamed(AppRoutes.profile),
        ),
      ]),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _users.length,
        itemBuilder: (context, index) {
          return UserRow(user: _users[index]);
        },
      ),
    );
  }
}

class UserRow extends StatelessWidget {
  const UserRow({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.name ?? user.email),
      subtitle: Text(user.email),
      onTap: () {
        //Navigate to chat page
      },
    );
  }
}
