import 'package:flappwrite_chat/res/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Appwrite Chat'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.of(context).pushNamed(AppRoutes.profile),
          ),
        ]
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const <Widget>[

        ],
      ),
    );
  }
}