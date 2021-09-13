import 'package:flutter/material.dart';
import 'package:flappwrite_account_kit/flappwrite_account_kit.dart';

//profile page
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authNotifier = context.authNotifier;
    final user = authNotifier.user;
    return Scaffold(
      appBar: AppBar(
        title: Text(user?.name ?? 'Profile'),
      ),
      body: (user == null)
          ? const Center(
              child: Text("User not logged in properly"),
            )
          : ListView(
              padding: const EdgeInsets.all(16.0),
              children: <Widget>[
                Text(
                  user.name,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  user.email,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  child: const Text('Logout'),
                  onPressed: () async {
                    if (await authNotifier.deleteSession()) {
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
    );
  }
}
